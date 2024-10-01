-- +migrate Up
-- +migrate StatementBegin

CREATE TABLE status (
    id INTEGER PRIMARY KEY,
    srv_status INTEGER
);

-- +migrate StatementEnd