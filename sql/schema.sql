create table criteria (
	crieria_id serial primary key,
	criteria_name text not null
);

create table testimonial (
	testimonial_id serial primary key,
	contact_id references contact(contact_id) not null,
	testimonial text not null,
	created timestamp not null
);

-- abstraction for geoname_id values
create table geoname_place (
	,
	place_id serial primary key
);

create table contact (
	contact_id serial primary key,
	email text, -- verify email as setup process
	fax text, -- verify fax as setup process
	address text, -- street
	apt_suite text,
	city text,
	state_province text,
	zip_postal text,
	country text,
	geoname_id ,
	notes text
);

create table user_account ( -- this needs to integrate with idios
	contact_id references contact(contact_id),
	email text not null,
	password text not null,
	salt text not null
);

create table country_coordinator (
	country_id integer references country(country_id),
);

create table country (
	geoname_id text primary key,
	place integer references place(place_id),
	country_id serial primary key,
	coordinator_id integer references country_coordinator(country_coordinator_id)
);