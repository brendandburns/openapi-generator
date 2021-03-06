# OpenAPI Petstore
#
# This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters.
#
# The version of the OpenAPI document: 1.0.0
# 
# Generated by: https://openapi-generator.tech

#' @title Pet operations
#' @description petstore.Pet
#'
#' @field path Stores url path of the request.
#' @field apiClient Handles the client-server communication.
#'
#' @importFrom R6 R6Class
#'
#' @section Methods:
#' \describe{
#'
#' AddPet Add a new pet to the store
#'
#'
#' DeletePet Deletes a pet
#'
#'
#' FindPetsByStatus Finds Pets by status
#'
#'
#' FindPetsByTags Finds Pets by tags
#'
#'
#' GetPetById Find pet by ID
#'
#'
#' UpdatePet Update an existing pet
#'
#'
#' UpdatePetWithForm Updates a pet in the store with form data
#'
#'
#' UploadFile uploads an image
#'
#' }
#'
#' @importFrom caTools base64encode
#' @export
PetApi <- R6::R6Class(
  'PetApi',
  public = list(
    apiClient = NULL,
    initialize = function(apiClient){
      if (!missing(apiClient)) {
        self$apiClient <- apiClient
      }
      else {
        self$apiClient <- ApiClient$new()
      }
    },
    AddPet = function(body, ...){
      apiResponse <- self$AddPetWithHttpInfo(body, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    AddPetWithHttpInfo = function(body, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      if (missing(`body`)) {
        stop("Missing required parameter `body`.")
      }

      if (!missing(`body`)) {
        body <- `body`$toJSONString()
      } else {
        body <- NULL
      }

      urlPath <- "/pet"
      # OAuth token
      headerParams['Authorization'] <- paste("Bearer", self$apiClient$accessToken, sep=" ")

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "POST",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        ApiResponse$new(NULL, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    },
    DeletePet = function(pet.id, api.key=NULL, ...){
      apiResponse <- self$DeletePetWithHttpInfo(pet.id, api.key, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    DeletePetWithHttpInfo = function(pet.id, api.key=NULL, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      if (missing(`pet.id`)) {
        stop("Missing required parameter `pet.id`.")
      }

      headerParams['api_key'] <- `api.key`

      urlPath <- "/pet/{petId}"
      if (!missing(`pet.id`)) {
        urlPath <- gsub(paste0("\\{", "petId", "\\}"), URLencode(as.character(`pet.id`), reserved = TRUE), urlPath)
      }

      # OAuth token
      headerParams['Authorization'] <- paste("Bearer", self$apiClient$accessToken, sep=" ")

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "DELETE",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        ApiResponse$new(NULL, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    },
    FindPetsByStatus = function(status, ...){
      apiResponse <- self$FindPetsByStatusWithHttpInfo(status, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    FindPetsByStatusWithHttpInfo = function(status, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      if (missing(`status`)) {
        stop("Missing required parameter `status`.")
      }

      queryParams['status'] <- status

      urlPath <- "/pet/findByStatus"
      # OAuth token
      headerParams['Authorization'] <- paste("Bearer", self$apiClient$accessToken, sep=" ")

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        deserializedRespObj <- self$apiClient$deserialize(resp, "array[Pet]", "package:petstore")
        ApiResponse$new(deserializedRespObj, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    },
    FindPetsByTags = function(tags, ...){
      apiResponse <- self$FindPetsByTagsWithHttpInfo(tags, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    FindPetsByTagsWithHttpInfo = function(tags, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      if (missing(`tags`)) {
        stop("Missing required parameter `tags`.")
      }

      queryParams['tags'] <- tags

      urlPath <- "/pet/findByTags"
      # OAuth token
      headerParams['Authorization'] <- paste("Bearer", self$apiClient$accessToken, sep=" ")

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        deserializedRespObj <- self$apiClient$deserialize(resp, "array[Pet]", "package:petstore")
        ApiResponse$new(deserializedRespObj, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    },
    GetPetById = function(pet.id, ...){
      apiResponse <- self$GetPetByIdWithHttpInfo(pet.id, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    GetPetByIdWithHttpInfo = function(pet.id, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      if (missing(`pet.id`)) {
        stop("Missing required parameter `pet.id`.")
      }

      urlPath <- "/pet/{petId}"
      if (!missing(`pet.id`)) {
        urlPath <- gsub(paste0("\\{", "petId", "\\}"), URLencode(as.character(`pet.id`), reserved = TRUE), urlPath)
      }

      # API key authentication
      if ("api_key" %in% names(self$apiClient$apiKeys) && nchar(self$apiClient$apiKeys["api_key"]) > 0) {
        headerParams['api_key'] <- paste(unlist(self$apiClient$apiKeys["api_key"]), collapse='')
      }

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        deserializedRespObj <- self$apiClient$deserialize(resp, "Pet", "package:petstore")
        ApiResponse$new(deserializedRespObj, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    },
    UpdatePet = function(body, ...){
      apiResponse <- self$UpdatePetWithHttpInfo(body, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    UpdatePetWithHttpInfo = function(body, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      if (missing(`body`)) {
        stop("Missing required parameter `body`.")
      }

      if (!missing(`body`)) {
        body <- `body`$toJSONString()
      } else {
        body <- NULL
      }

      urlPath <- "/pet"
      # OAuth token
      headerParams['Authorization'] <- paste("Bearer", self$apiClient$accessToken, sep=" ")

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "PUT",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        ApiResponse$new(NULL, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    },
    UpdatePetWithForm = function(pet.id, name=NULL, status=NULL, ...){
      apiResponse <- self$UpdatePetWithFormWithHttpInfo(pet.id, name, status, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    UpdatePetWithFormWithHttpInfo = function(pet.id, name=NULL, status=NULL, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      if (missing(`pet.id`)) {
        stop("Missing required parameter `pet.id`.")
      }

      body <- list(
        "name" = name,
        "status" = status
      )

      urlPath <- "/pet/{petId}"
      if (!missing(`pet.id`)) {
        urlPath <- gsub(paste0("\\{", "petId", "\\}"), URLencode(as.character(`pet.id`), reserved = TRUE), urlPath)
      }

      # OAuth token
      headerParams['Authorization'] <- paste("Bearer", self$apiClient$accessToken, sep=" ")

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "POST",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        ApiResponse$new(NULL, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    },
    UploadFile = function(pet.id, additional.metadata=NULL, file=NULL, ...){
      apiResponse <- self$UploadFileWithHttpInfo(pet.id, additional.metadata, file, ...)
      resp <- apiResponse$response
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        apiResponse$content
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        apiResponse
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        apiResponse
      }
    },

    UploadFileWithHttpInfo = function(pet.id, additional.metadata=NULL, file=NULL, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- c()

      if (missing(`pet.id`)) {
        stop("Missing required parameter `pet.id`.")
      }

      body <- list(
        "additionalMetadata" = additional.metadata,
        "file" = httr::upload_file(file)
      )

      urlPath <- "/pet/{petId}/uploadImage"
      if (!missing(`pet.id`)) {
        urlPath <- gsub(paste0("\\{", "petId", "\\}"), URLencode(as.character(`pet.id`), reserved = TRUE), urlPath)
      }

      # OAuth token
      headerParams['Authorization'] <- paste("Bearer", self$apiClient$accessToken, sep=" ")

      resp <- self$apiClient$CallApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "POST",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        deserializedRespObj <- self$apiClient$deserialize(resp, "ModelApiResponse", "package:petstore")
        ApiResponse$new(deserializedRespObj, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        ApiResponse$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        ApiResponse$new("API server error", resp)
      }
    }
  )
)
