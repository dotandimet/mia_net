create table units (
  name varchar2(10) not null primary key,
  type varchar2(10) not null
  -- volume, weight
);

insert into units(name, type) values('gr', 'weight');
insert into units(name, type) values('ml', 'volume');
insert into units(name, type) values('liter', 'volume');

create table approval_status (
  name varchar2(10) primary key
);
insert into approval_status(name) values('draft');
insert into approval_status(name) values('calibration');
insert into approval_status(name) values('pending');
insert into approval_status(name) values('approved');

create table protocols (
  id integer primary key autoincrement,
  name varchar2(200) not null,
  description varchar2(2000),
  version integer not null default 1,
  status varchar2(10) default 'draft',
  base_quantity numeric,
  base_units varchar2(10),
  foreign key(status) references approval_status(name),
  foreign key(base_units) references units(name)
);

create table stages (
  id integer primary key autoincrement,
  title varchar2(200) not null,
  description varchar2(2000),
  protocol_id integer not null,
  foreign key (protocol_id) references protocols(id)
);

create table steps (
  id integer primary key autoincrement,
  protocol_id integer not null,
  step integer not null,
  text varchar2(2000) not null,
  stage integer,
  foreign key(protocol_id) references protocols(id),
  foreign key(stage) references stages(id),
  unique (protocol_id, step)
);

-- records to fill during a step
create table record_fields (
  id integer primary key autoincrement,
  step_id integer,
  field_type varchar2(10) not null,
  field_name varchar2(50) not null,
  field_order integer not null,
  foreign key(step_id) references steps(id)
);

create table ingredients (
  id integer primary key autoincrement,
  protocol_id integer not null,
  step_id integer not null,
  quantity numeric not null,
  units varchar2(10),
  product_id integer not null,
  foreign key(protocol_id) references protocols(id),
  foreign key(step_id) references steps(id),
  foreign key(units) references units(name),
  foreign key (product_id) references products(id)
);

create table materials (
  id integer primary key autoincrement,
  product_id integer not null,
  for varchar2(50),
  receiving_date integer,
  opening_date integer,
  finishing_date integer,
  batch_lot varchar2(50),
  product_catalog varchar2(50) not null,
  expiry_date integer,
  foreign key (product_id) references products
);

create table products (
  id integer primary key,
  product_number varchar2(50) unique,
  name varchar2(600) not null,
  manufacturer varchar2(50),
  supplier varchar2(50),
  is_stock boolean,
  concentration varchar2(50)
);

create table users (
  id integer primary key autoincrement,
  name varchar2(60) not null unique,
  password varchar2(64) not null
);

insert into users(name, password) values('niran', 'evohack');
insert into users(name, password) values('carmit', 'evohack');

create table runs (
  id integer primary key autoincrement,
  protocol_id integer not null,
  user integer not null,
  start_time integer,
  end_time integer,
  project varchar2(60),
  experiment varchar2(10),
  quantity numeric,
  foreign key (user) references users(id),
  foreign key(protocol_id) references protocols(id)
);

create table run_steps (
  id integer primary key autoincrement,
  step_id integer not null,
  start_time date,
  end_time date,
  foreign key(step_id) references steps(id)
);

create table run_records (
  id integer primary key autoincrement,
  step_id integer,
  record_field_id integer,
  record_field_value varchar2(500),
  batch_id integer,
  foreign key(step_id) references run_steps(id),
  foreign key(batch_id) references materials(id),
  foreign key(record_field_id) references record_fields(id)
);
