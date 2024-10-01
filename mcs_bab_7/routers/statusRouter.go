package routers

import (
	"srvo-cntrllr/controllers"

	"github.com/gin-gonic/gin"
)

func StartServer() *gin.Engine {
	router := gin.Default()

	router.POST("/servo/init-proj", controllers.InitProj)
	router.GET("/servo/status", controllers.GetStatus)
	router.PUT("/servo/:id", controllers.UpdateStatus)

	return router
}
