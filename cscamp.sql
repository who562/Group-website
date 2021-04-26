CREATE DATABASE cscamp;
USE cscamp;

CREATE TABLE volunteer_info (
    vol_id      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    hire_date   DATE            NOT NULL,
    PRIMARY KEY  (vol_id)
);

CREATE TABLE manager_info (
    man_id      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    hire_date   DATE            NOT NULL,
    PRIMARY KEY  (man_id)
)

CREATE TABLE volunteer_hours (
    vol_id      INT             NOT NULL,
    curr_date   DATE            NOT NULL,
    time_in     TIME            NOT NULL,
    time_out    TIME            NOT NULL,
    FOREIGN KEY  (vol_id)   REFERENCES volunteer_info (vol_id),
    PRIMARY KEY (vol_id)    
);


CREATE TABLE jobs (
    job_id      INT             NOT NULL,
    job_name    VARCHAR(25)     NOT NULL,
    man_id      INT             NOT NULL,
    start_date  DATE            NOT NULL,
    end_date    DATE            NOT NULL,
    FOREIGN KEY (man_id)    REFERENCES manager_info (man_id),
    PRIMARY KEY (job_id)
);

CREATE TABLE tasks (
    task_id     INT             NOT NULL,
    task_name   VARCHAR(50)     NOT NULL,
    job_id      INT             NOT NULL,
    start_date    DATE            NOT NULL,
    end_date    DATE            NOT NULL,
    PRIMARY KEY (task_id),
    FOREIGN KEY (vol_id)   REFERENCES volunteer_info (vol_id),
    FOREIGN KEY (job_id)   REFERENCES jobs(job_id)
);

CREATE TABLE donor_info (
    donor_id    INT             NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    start_date  DATE            NOT NULL,
    PRIMARY KEY (donor_id)
);

CREATE TABLE donations (
    don_id      INT             NOT NULL,
    don_name    VARCHAR(50)     NOT NULL,
    donor_id    INT             NOT NULL,
    curr_date   DATE            NOT NULL,
    don_total   MONEY           NOT NULL,
    PRIMARY KEY (don_id),
    FOREIGN KEY (donor_id)  REFERENCES donor_info (donor_id)
);

INSERT INTO volunteer_info (vol_id, birth_date, first_name, last_name, hire_date)
VALUES
(2001, 07/27/1997, Genesis, McAllen, 05/10/2021),
(2002, 02/07/1993, Hazel, Gonzalez, 05/15/2021),
(2003, 11/21/2000, Michael, Smith, 05/15/2021),
(2004, 09/18/1988, Jennifer, Carmichael, 05/16/2021),
(2005, 12/25/2003, Benjamin, Figueroa, 05/16/2021),
(2006, 04/16/1998, Janet, Robinson, 05/16/2021);

INSERT INTO manager_info (man_id, birth_date, first_name, last_name, hire_date)
VALUES
(3001, 08/13/1985, Harrison, Perry, 01/09/2021),
(3002, 12/15/1992, Storm, Willis, 01/09/2021),
(3003, 01/25/1990, Stephanie, Kim, 01/10/2021);

INSERT INTO jobs (job_id, job_name, man_id, start_date, end_date) 
VALUES
(7068, "Web Development", 3002, 06/14/2021, 07/02/2021),
(7071, "Gadgeteers", 3003, 06/14/2021, 07/02/2021),
(7079, "Data Analysis", 3001, 06/14/2021, 07/02/2021);

INSERT INTO tasks (task_id, task_name, job_id, start_date, end_date)
VALUES
(8031, "HTML & CSS", 7068, 06/14/2021, 06/18/2021),
(8035, "Python", 7079, 06/14/2021, 06/18/2021),
(8037, "Arduino", 7071, 06/14/2021, 06/18/2021),
(8042, "JavaScript & JQuery", 7068, 06/21/2021, 06/25/2021),
(8046, "R", 7079, 06/21/2021, 06/25/2021),
(8048, "Raspberry Pi", 7071, 06/21/2021, 06/25/2021),
(8053, "Web Dev Projects", 7068, 06/28/2021, 07/02/2021),
(8057, "Data Projects", 7079, 06/28/2021, 07/02/2021),
(8059, "Gadget Projects", 7071, 06/18/2021, 07/02/2021);