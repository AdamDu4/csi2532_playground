create table professeurs (
    ssn int not null,
    primary key (ssn)
);

create table courses (
    courseid char(8) not null,
    primary key (courseid)
);

create table group (
    groupid int not null,
    ssn int not null,
    primary key (groupid, ssn),
    foreign key ssn references professeurs
);

create table teaches (
    groupid int,
    courseid char(8) not null,
    semesterid varchar(15) not null,
    primary key (courseid, semesterid),
    foreign key (groupid) references groups,
    foreign key (courseid) references courses
);