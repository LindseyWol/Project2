-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/OrWyw3

CREATE TABLE "Countries" (
    "country" varchar(100)   NOT NULL UNIQUE,
    "country_code" varchar(10)   NOT NULL UNIQUE,
    "currency_code" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Countries" PRIMARY KEY (
        "country"
     )
);

CREATE TABLE "BigMac" (
    "country" varchar(100)   NOT NULL,
    "year" int   NOT NULL,
    "dollar_price" numeric   NOT NULL,
    CONSTRAINT "pk_BigMac" PRIMARY KEY (
        "country","year"
     )
);

CREATE TABLE "MinWage" (
    "country" varchar(100)   NOT NULL,
    "year" int   NOT NULL,
    "hourly_wage" numeric   NOT NULL,
    CONSTRAINT "pk_MinWage" PRIMARY KEY (
        "country","year"
     )
);

CREATE TABLE "MeatConsumption" (
    "country_code" varchar(10)   NOT NULL,
    "year" int   NOT NULL,
    "kg_person" numeric   NOT NULL,
    CONSTRAINT "pk_MeatConsumption" PRIMARY KEY (
        "country_code","year"
     )
);

CREATE TABLE "AvgIncome" (
    "country_code" varchar(10)   NOT NULL,
    "year" int   NOT NULL,
    "avg_income" numeric   NOT NULL,
    CONSTRAINT "pk_AvgIncome" PRIMARY KEY (
        "country_code","year"
     )
);

CREATE TABLE "CurrencyEx" (
    "currency_code" varchar(10)   NOT NULL,
    "year" int   NOT NULL,
    "dollar_ex" numeric   NOT NULL,
    CONSTRAINT "pk_CurrencyEx" PRIMARY KEY (
        "currency_code","year"
     )
);

CREATE TABLE "Currency" (
    "currency_code" varchar(10)   NOT NULL UNIQUE,
    "currency" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Currency" PRIMARY KEY (
        "currency_code"
     )
);

ALTER TABLE "Countries" ADD CONSTRAINT "fk_Countries_currency_code" FOREIGN KEY("currency_code")
REFERENCES "Currency" ("currency_code");

ALTER TABLE "BigMac" ADD CONSTRAINT "fk_BigMac_country" FOREIGN KEY("country")
REFERENCES "Countries" ("country");

ALTER TABLE "MinWage" ADD CONSTRAINT "fk_MinWage_country" FOREIGN KEY("country")
REFERENCES "Countries" ("country");

ALTER TABLE "MeatConsumption" ADD CONSTRAINT "fk_MeatConsumption_country_code" FOREIGN KEY("country_code")
REFERENCES "Countries" ("country_code");

ALTER TABLE "AvgIncome" ADD CONSTRAINT "fk_AvgIncome_country_code" FOREIGN KEY("country_code")
REFERENCES "Countries" ("country_code");

ALTER TABLE "CurrencyEx" ADD CONSTRAINT "fk_CurrencyEx_currency_code" FOREIGN KEY("currency_code")
REFERENCES "Currency" ("currency_code");

