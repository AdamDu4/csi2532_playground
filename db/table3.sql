create table professeurs (
    ssn int not null,
    primary key (ssn)
);

create table courses (
    courseid char(8) not null,
    primary key (courseid)
);

create table teaches (
    ssn int not null,
    courseid char(8) not null,
    semesterid varchar(15) not null,
    primary key (ssn),
    foreign key (ssn) references professeurs,
    foreign key (courseid) references courses
);