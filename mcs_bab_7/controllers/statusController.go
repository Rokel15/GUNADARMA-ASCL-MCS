package controllers

import (
	"net/http"
	"srvo-cntrllr/database"
	"srvo-cntrllr/entities"
	"srvo-cntrllr/repositories"
	"strconv"

	"github.com/gin-gonic/gin"
)

func InitProj(c *gin.Context) {
	var id entities.Status

	err := repositories.InitProj(database.DbConnection, id)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, id)
}

func GetStatus(c *gin.Context) {
	var result gin.H

	status, err := repositories.GetStatus(database.DbConnection)

	if err != nil {
		result = gin.H{
			"result": err.Error(),
		}
	} else {
		result = gin.H{
			"result": status,
		}
	}

	c.JSON(http.StatusOK, result)
}

func UpdateStatus(c *gin.Context) {
	var status entities.Status
	id, _ := strconv.Atoi(c.Param("id"))

	// err := c.BindJSON(&status)
	// if err != nil {
	// 	panic(err)
	// }

	status.SrvStatus = id

	err := repositories.UpdateStatus(database.DbConnection, status)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"srvStatus": status.SrvStatus,
	})
}
