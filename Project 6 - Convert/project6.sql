/*
 *  projec6.sql
 * 
 *  author: Lauren Sherburne
 *  date: 10/29/2021
 *
 */

-- Drop tables if they exist
DROP TABLE IF EXISTS reviewer;
DROP TABLE IF EXISTS chain CASCADE;
DROP TABLE IF EXISTS business CASCADE;
DROP TABLE IF EXISTS business_type;
DROP TABLE IF EXISTS menu;


-- Entity: reviewer
CREATE TABLE reviewer (
    screen_name text NOT NULL UNIQUE,
    identity_provider text NOT NULL,
    PRIMARY KEY (screen_name, identity_provider)
);

-- Entity: chain
CREATE TABLE chain (
    name text PRIMARY KEY,
    city text,
    state character(2)
);

-- Entity: business
CREATE TABLE business (
    ID serial PRIMARY KEY,
    name text,
    street_address text,
    city text,
    state character(2),
    zip numeric(5),
    chain_name text REFERENCES chain(name)
);

-- Multi-Valued Attribute: business type
CREATE TABLE business_type (
    business_type text NOT NULL,
    business_id integer NOT NULL REFERENCES business(ID),
    PRIMARY KEY (business_type, business_id)
);

-- Weak Entity: menu
CREATE TABLE menu (
    label text NOT NULL,
    url text,
    business_id integer NOT NULL REFERENCES business(ID),
    PRIMARY KEY (business_id, label)
);

-- N:M Relationship: business & reviewer xref table
CREATE TABLE business_reviewer_xref (
    business_id integer NOT NULL REFERENCES business(ID),
    rev_sc_name text NOT NULL,
    rev_id_provider text NOT NULL,
    FOREIGN KEY (rev_sc_name, rev_id_provider)
        REFERENCES reviewer(screen_name, identity_provider),
    PRIMARY KEY (business_id, rev_sc_name, rev_id_provider),
    views integer NOT NULL,
    rating integer CHECK (rating >= 0 AND rating <= 5),
    review_date date,
    comments text
);
