require 'pg'

connection = PG.connect(
	dbname: 'student',
	user: "postgres",
	password: "postpass",
	host:"localhost",
	port: 5432
)

result = connection.exec("SELECT * FROM student")
result.each{|row| puts row}