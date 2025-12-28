from flask import Flask, render_template, request, redirect, url_for, session, make_response, flash
from models import DaftarAlumni, DaftarProdi, DaftarFakultas, User

app = Flask(__name__)
app.secret_key = "si-alumni-secret-key-13"

def login_required():
    return 'user_id' in session 

def admin_only():
    return session.get("role") == "admin"

def pengguna_only():
    return session.get("role") == "pengguna"

@app.route('/')
def beranda():
    """Halaman landing page sebelum login"""
    return render_template('beranda.html')

# login
@app.route('/login', methods=['GET','POST'])
def login():
    if 'user_id' in session:
        return redirect(url_for('index'))
    
    message = ""
    last_username = request.cookies.get('last_username', '')
    
    if request.method == 'POST':
        username = request.form.get("username")
        password = request.form.get("password")
        user = User.check_login(username, password)
        if user:
            session['user_id'] = user['id_user']
            session['username'] = user['username']
            session['role'] = user['role']
            session['nim'] = user['nim']
            resp = make_response(redirect(url_for('index')))
            resp.set_cookie("last_username", username, max_age=60*60*24*7)
            return resp
        else:
            message = "Username atau password salah."
    
    return render_template('login.html', message=message, last_username=last_username)

# logout
@app.route('/logout')
def logout():
    session.clear()
    resp = make_response(redirect(url_for('beranda')))
    resp.set_cookie("last_username", "", max_age=0)
    return resp

# index
@app.route('/index')
def index():
    if not login_required():
        return redirect(url_for('login'))
    
    prodi = DaftarProdi.get_all()
    fakultas = DaftarFakultas.get_all()
    alumni = DaftarAlumni.get_all()
    last_username = request.cookies.get('last_username')
    
    return render_template(
        'index.html',
        prodi=prodi,
        fakultas=fakultas,
        alumni=alumni,
        username=session.get('username'),
        role=session.get('role'),
        last_username=last_username
    )

# profile
@app.route('/profile')
def profile():
    if not login_required():
        return redirect(url_for('login'))

    role = session.get("role")

    if role == "pengguna":
        nim = session.get("nim")
        alumni = DaftarAlumni.get_by_id(nim)
        return render_template(
            'profile.html',
            alumni=alumni,
            username=session.get("username"),
            role=role
        )

    admin = User.get_by_username(session.get("username"))
    return render_template(
        'profile_admin.html',
        admin=admin,
        username=session.get("username"),
        role=role
    )

# prodi
@app.route('/prodi')
def daftar_prodi():
    if not login_required(): 
        return redirect(url_for('login'))

    semua_prodi = DaftarProdi.get_all()
    last_username = request.cookies.get('last_username')
    return render_template('daftar_prodi.html', prodi=semua_prodi, username=session.get('username'), role=session.get('role'), last_username=last_username)

@app.route('/prodi/insert')
def form_insert_prodi():
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    return render_template('insert_prodi.html')

@app.route('/prodi/insert', methods=['POST'])
def insert_prodi():
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    nama_prodi = request.form.get("nama_prodi")
    deskripsi = request.form.get("deskripsi")
    DaftarProdi.create(nama_prodi, deskripsi)
    flash("Data prodi berhasil ditambahkan!", "success")
    return redirect(url_for('daftar_prodi'))

@app.route('/prodi/update/<int:id_prodi>')
def form_update_prodi(id_prodi):
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    data = DaftarProdi.get_by_id(id_prodi)
    return render_template('update_prodi.html', data=data)

@app.route('/prodi/update/<int:id_prodi>', methods=['POST'])
def update_prodi(id_prodi):
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    nama_prodi = request.form.get("nama_prodi")
    deskripsi = request.form.get("deskripsi")
    DaftarProdi.update(id_prodi, nama_prodi, deskripsi)
    flash("Data prodi berhasil diupdate!", "success")
    return redirect(url_for('daftar_prodi'))

@app.route('/prodi/delete/<int:id_prodi>')
def delete_prodi(id_prodi):
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    DaftarProdi.delete(id_prodi)
    return redirect(url_for('daftar_prodi'))

# fakultas
@app.route('/fakultas')
def daftar_fakultas():
    if not login_required(): 
        return redirect(url_for('login'))

    semua_fakultas = DaftarFakultas.get_all()
    last_username = request.cookies.get('last_username')
    return render_template('daftar_fakultas.html', fakultas=semua_fakultas, username=session.get('username'), role=session.get('role'), last_username=last_username)

@app.route('/fakultas/insert')
def form_insert_fakultas():
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    return render_template('insert_fakultas.html')

@app.route('/fakultas/insert', methods=['POST'])
def insert_fakultas():
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    nama_fakultas = request.form.get("nama_fakultas")
    deskripsi = request.form.get("deskripsi")
    DaftarFakultas.create(nama_fakultas, deskripsi)
    flash("Data fakultas berhasil ditambahkan!", "success")
    return redirect(url_for('daftar_fakultas'))

@app.route('/fakultas/update/<int:id_fakultas>')
def form_update_fakultas(id_fakultas):
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    data = DaftarFakultas.get_by_id(id_fakultas)
    return render_template('update_fakultas.html', data=data)

@app.route('/fakultas/update/<int:id_fakultas>', methods=['POST'])
def update_fakultas(id_fakultas):
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    nama_fakultas = request.form.get("nama_fakultas")
    deskripsi = request.form.get("deskripsi")
    DaftarFakultas.update(id_fakultas, nama_fakultas, deskripsi)
    flash("Data fakultas berhasil diupdate!", "success")
    return redirect(url_for('daftar_fakultas'))

@app.route('/fakultas/delete/<int:id_fakultas>')
def delete_fakultas(id_fakultas):
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    DaftarFakultas.delete(id_fakultas)
    return redirect(url_for('daftar_fakultas'))

# alumni
@app.route('/alumni')
def daftar_alumni():
    if not login_required(): 
        return redirect(url_for('login'))

    semua_alumni = DaftarAlumni.get_all()
    last_username = request.cookies.get('last_username')
    return render_template('daftar_alumni.html', alumni=semua_alumni, username=session.get('username'), role=session.get('role'), last_username=last_username)

@app.route('/alumni/insert')
def form_insert_alumni():
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    prodi = DaftarProdi.get_all()
    fakultas = DaftarFakultas.get_all()
    return render_template("insert_alumni.html", prodi=prodi, fakultas=fakultas)

@app.route('/alumni/insert', methods=['POST'])
def insert_alumni():
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    nim = request.form.get("nim")
    nama = request.form.get("nama")
    tempat_lahir = request.form.get("tempat_lahir")
    tanggal_lahir = request.form.get("tanggal_lahir")
    jenis_kelamin = request.form.get("jenis_kelamin")
    alamat = request.form.get ("alamat")
    no_hp = request.form.get ("no_hp")
    email = request.form.get("email")
    id_prodi = request.form.get("id_prodi")
    id_fakultas = request.form.get("id_fakultas")
    jalur_masuk = request.form.get("jalur_masuk")
    tahun_masuk = request.form.get("tahun_masuk")
    tahun_lulus = request.form.get("tahun_lulus")
    DaftarAlumni.create(nim, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, no_hp, email, id_prodi, id_fakultas, jalur_masuk, tahun_masuk, tahun_lulus)
    flash("Data alumni berhasil ditambahkan!", "success")
    return redirect(url_for('daftar_alumni'))

@app.route('/alumni/update/<int:nim>')
def form_update_alumni(nim):
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    data = DaftarAlumni.get_by_id(nim)
    prodi = DaftarProdi.get_all()
    fakultas = DaftarFakultas.get_all()
    return render_template('update_alumni.html', data=data, prodi=prodi, fakultas=fakultas)

@app.route('/alumni/update/<int:nim>', methods=['POST'])
def update_alumni(nim):
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak! (Admin Only)"
    nim = request.form.get("nim")
    nama = request.form.get("nama")
    tempat_lahir = request.form.get("tempat_lahir")
    tanggal_lahir = request.form.get("tanggal_lahir")
    jenis_kelamin = request.form.get("jenis_kelamin")
    alamat = request.form.get ("alamat")
    no_hp = request.form.get ("no_hp")
    email = request.form.get("email")
    id_prodi = request.form.get("id_prodi")
    id_fakultas = request.form.get("id_fakultas")
    jalur_masuk = request.form.get("jalur_masuk")
    tahun_masuk = request.form.get("tahun_masuk")
    tahun_lulus = request.form.get("tahun_lulus")
    DaftarAlumni.update(nim, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, no_hp, email, id_prodi, id_fakultas, jalur_masuk, tahun_masuk, tahun_lulus)
    flash("Data alumni berhasil diupdate!", "success")
    return redirect(url_for('daftar_alumni'))

@app.route('/alumni/delete/<int:nim>')
def delete_alumni(nim):
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Akses ditolak!(Admin Only)"
    DaftarAlumni.delete(nim)
    return redirect(url_for('daftar_alumni'))

# register
@app.route('/register', methods=['GET', 'POST'])
def register():
    if not login_required(): return redirect(url_for('login'))
    if not admin_only(): return "Hanya admin yang dapat menambahkan user baru."

    alumni = DaftarAlumni.get_all()

    if request.method == 'POST':
        username = request.form.get("username")
        password = request.form.get("password")
        role = request.form.get("role")
        nim = request.form.get("nim") if role == "pengguna" else None
        User.create_user(username, password, role, nim)
        return redirect(url_for('index'))

    return render_template('register.html', alumni=alumni)

if __name__ == '__main__':
    app.run(debug=True)