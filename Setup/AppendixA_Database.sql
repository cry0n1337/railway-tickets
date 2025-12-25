-- Appendix A. Database schema RailwayTicket v1.0
-- СУБД PostgreSQL (если используешь MySQL – типы чуть измени)

CREATE TABLE "User" (
    Id          SERIAL PRIMARY KEY,
    Login       VARCHAR(50) UNIQUE NOT NULL,
    PasswordHash VARCHAR(60)       NOT NULL,
    Role        VARCHAR(20) CHECK (Role IN ('Passenger','Cashier','Admin'))
);

CREATE TABLE Train (
    Id            SERIAL PRIMARY KEY,
    Number        VARCHAR(10)  NOT NULL,
    Route         VARCHAR(200) NOT NULL,
    DepartureTime TIMESTAMP    NOT NULL,
    ArrivalTime   TIMESTAMP    NOT NULL,
    TotalSeats    INTEGER      NOT NULL,
    FreeSeats     INTEGER      NOT NULL
);

CREATE TABLE Ticket (
    Id            SERIAL PRIMARY KEY,
    TrainId       INTEGER REFERENCES Train(Id) ON DELETE CASCADE,
    PassengerName VARCHAR(100) NOT NULL,
    SeatNumber    INTEGER      NOT NULL,
    PurchaseDate  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (TrainId, SeatNumber)
);