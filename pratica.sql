CREATE DATABASE "banco_de_dados_pratica";

CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	"password" TEXT NOT NULL,
    "cpf" TEXT NOT NULL UNIQUE,
    "email" TEXT NOT NULL UNIQUE
);

CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"number" TEXT NOT NULL UNIQUE,
    "type" BOOLEAN
);

CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
    "stadeId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "customerAdresses" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"street" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "complement" TEXT,
    "postalCode" TEXT NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id"),
);

CREATE TABLE "bankAccount" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"accountNumber" TEXT NOT NULL UNIQUE,
    "agency" TEXT NOT NULL,
    "openDate" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    "closeDate" TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE "transactions" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountrId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"amount" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "time" TIMESTAMP NOT NULL DEFAULT NOW(),
    "description" TEXT NOT NULL,
    "cancelled" BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE "creditCards" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountrId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"name" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "securityCode" TEXT NOT NULL,
    "expirationMonth" TEXT NOT NULL,
    "descriptionYear" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "limit" INTEGER NOT NULL 
);


