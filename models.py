import os
import pymysql
from werkzeug.security import generate_password_hash, check_password_hash

class Database:
    def __init__(self):
        self.connection = pymysql.connect(
            host=os.getenv("MYSQLHOST"),
            user=os.getenv("MYSQLUSER"),
            password=os.getenv("MYSQLPASSWORD"),
            database=os.getenv("MYSQLDATABASE"),
            port=int(os.getenv("MYSQLPORT", 51174)),
            cursorclass=pymysql.cursors.DictCursor,
            ssl={"ssl": {}}
        )
    def query(self, sql, params=None):
        cursor = self.connection.cursor()
        cursor.execute(sql, params)
        self.connection.commit()
        return cursor
    
    def fetchall(self, sql, params=None):
        cursor = self.query(sql, params)
        return cursor.fetchall()
    
    def fetchone(self, sql, params=None):
        cursor = self.query(sql, params)
        return cursor.fetchone()
    
db = Database()

class DaftarProdi:

    @staticmethod
    def create(nama_prodi, deskripsi):
        sql = "INSERT INTO daftar_prodi (nama_prodi, deskripsi) VALUES (%s, %s)"
        db.query(sql, (nama_prodi, deskripsi))
        return True
    
    @staticmethod
    def get_all():
        sql = "SELECT * FROM daftar_prodi"
        return db.fetchall(sql)
    
    @staticmethod
    def get_by_id(id_prodi):
        sql = "SELECT * FROM daftar_prodi WHERE id_prodi = %s"
        return db.fetchone(sql, (id_prodi,))
    
    @staticmethod
    def update(id_prodi, nama_prodi, deskripsi):
        sql = "UPDATE daftar_prodi SET nama_prodi = %s, deskripsi = %s WHERE id_prodi = %s"
        db.query(sql, (nama_prodi, deskripsi, id_prodi))
        return True
    
    @staticmethod
    def delete(id_prodi):
        sql = "DELETE FROM daftar_prodi WHERE id_prodi = %s"
        db.query(sql, (id_prodi,))
        return True

class DaftarFakultas:

    @staticmethod
    def create(nama_fakultas, deskripsi):
        sql = "INSERT INTO daftar_fakultas (nama_fakultas, deskripsi) VALUES (%s, %s)"
        db.query(sql, (nama_fakultas, deskripsi))
        return True
    
    @staticmethod
    def get_all():
        sql = "SELECT * FROM daftar_fakultas"
        return db.fetchall(sql)
    
    @staticmethod
    def get_by_id(id_fakultas):
        sql = "SELECT * FROM daftar_fakultas WHERE id_fakultas = %s"
        return db.fetchone(sql, (id_fakultas,))
    
    @staticmethod
    def update(id_fakultas, nama_fakultas, deskripsi):
        sql = "UPDATE daftar_fakultas SET nama_fakultas = %s, deskripsi = %s WHERE id_fakultas = %s"
        db.query(sql, (nama_fakultas, deskripsi, id_fakultas))
        return True
    
    @staticmethod
    def delete(id_fakultas):
        sql = "DELETE FROM daftar_fakultas WHERE id_fakultas = %s"
        db.query(sql, (id_fakultas,))
        return True
    
class DaftarAlumni:
    @staticmethod
    def create(nim, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, no_hp, email, id_prodi, id_fakultas, jalur_masuk, tahun_masuk, tahun_lulus):
        sql = """
        INSERT INTO daftar_alumni (nim, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, no_hp, email, id_prodi, id_fakultas, jalur_masuk, tahun_masuk, tahun_lulus)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        db.query(sql, (nim, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, no_hp, email, id_prodi, id_fakultas, jalur_masuk, tahun_masuk, tahun_lulus))
        return True
    
    @staticmethod
    def get_all():
        sql = """
        SELECT 
            a.*,
            p.nama_prodi,
            f.nama_fakultas
        FROM daftar_alumni a
        JOIN daftar_prodi p ON a.id_prodi = p.id_prodi
        JOIN daftar_fakultas f ON a.id_fakultas = f.id_fakultas
        """
        return db.fetchall(sql)
    
    @staticmethod
    def get_by_id(nim):
        sql = """
        SELECT 
            a.*,
            p.nama_prodi,
            f.nama_fakultas
        FROM daftar_alumni a
        JOIN daftar_prodi p ON a.id_prodi = p.id_prodi
        JOIN daftar_fakultas f ON a.id_fakultas = f.id_fakultas
        WHERE a.nim = %s
        """
        return db.fetchone(sql, (nim,))
    
    @staticmethod
    def get_by_prodi(id_prodi):
        sql = "SELECT * FROM daftar_alumni WHERE id_prodi = %s"
        return db.fetchall(sql, (id_prodi,))
    
    @staticmethod
    def update(nim, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, no_hp, email, id_prodi, id_fakultas, jalur_masuk, tahun_masuk, tahun_lulus):
        sql = """UPDATE daftar_alumni
        SET nama = %s, tempat_lahir = %s, tanggal_lahir = %s, jenis_kelamin = %s, alamat = %s, no_hp = %s, email = %s, id_prodi = %s, id_fakultas = %s, jalur_masuk = %s, tahun_masuk = %s, tahun_lulus = %s
        WHERE nim = %s"""
        db.query(sql, (nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, no_hp, email, id_prodi, id_fakultas, jalur_masuk, tahun_masuk, tahun_lulus, nim))
        return True
    
    @staticmethod
    def delete(nim):
        sql = "DELETE FROM daftar_alumni WHERE nim = %s"
        db.query(sql, (nim,))
        return True
    
class User:
    @staticmethod
    def create_user(username, password, role, nim):
        hashed = generate_password_hash(password)
        sql = """
        INSERT INTO users (username, password, role, nim)
        VALUES (%s, %s, %s, %s)
        """
        db.query(sql, (username, hashed, role, nim))
        return True
    
    @staticmethod
    def check_login(username, password):
        sql = "SELECT * FROM users WHERE username = %s"
        user = db.fetchone(sql, (username,))
        
        if user and check_password_hash(user["password"], password):
            return user
        return None
