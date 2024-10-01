package main

import (
	"database/sql"
	"fmt"
	"log"
	"os"
	"srvo-cntrllr/database"
	"srvo-cntrllr/routers"

	"github.com/gin-contrib/cors"
	_ "github.com/lib/pq"
)

func main() {
	var PORT = ":" + os.Getenv("PORT")

	// psqlInfo := fmt.Sprintf(
	// 	`host=%s port=%d user=%s password=%s dbname=%s sslmode=disable`,
	// 	host, port, user, password, dbName,
	// )

	psqlInfo := os.Getenv("DATABASE_URL")

	DB, err := sql.Open("postgres", psqlInfo)

	if err != nil {
		log.Fatalf("Error Open DB: %v\n", err)
	}

	err = DB.Ping()
	if err != nil {
		log.Fatalf("Error pinging DB : %v\n", err)
	}

	database.DBMigrate(DB)

	defer DB.Close()

	// Start server with CORS enabled
	r := routers.StartServer()

	// Adding CORS middleware with default settings
	r.Use(cors.Default())

	r.Run(PORT)
	fmt.Println("berhasil konek...")
}
