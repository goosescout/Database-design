CREATE TABLE sortme.User (
    id SERIAL PRIMARY KEY,
    avatar_url VARCHAR(255),
    username VARCHAR(255) NOT NULL UNIQUE,
    real_name VARCHAR(255),
    tg_url VARCHAR(255),
    google_url VARCHAR(255),
    bio VARCHAR(2047),
    registered_at TIMESTAMP NOT NULL
);

CREATE TABLE sortme.Lang (
    id SERIAL PRIMARY KEY,
    api_name VARCHAR(255) NOT NULL,
    verbose_name VARCHAR(255) NOT NULL,
    highlight_name VARCHAR(255) NOT NULL
);

CREATE TABLE sortme.Extension (
    id SERIAL PRIMARY KEY,
    extension VARCHAR(255) NOT NULL
);

CREATE TABLE sortme.Lang_Extensions (
    Extension_id INT  NOT NULL REFERENCES sortme.Extension(id),
    Lang_id INT  NOT NULL REFERENCES sortme.Lang(id),
    PRIMARY KEY (Extension_id, Lang_id)
);

CREATE TABLE sortme.Problem (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    main_description VARCHAR(2047),
    in_description VARCHAR(2047),
    out_description VARCHAR(2047),
    time_limit INT NOT NULL,
    memory_limit INT NOT NULL,
    rating_system VARCHAR(2047),
    difficulty INT,
    comments VARCHAR(2047)
);

CREATE TABLE sortme.Problem_Langs (
    Problem_id INT NOT NULL REFERENCES sortme.Problem(id),
    Lang_id INT NOT NULL REFERENCES sortme.Lang(id),
    PRIMARY KEY (Problem_id, Lang_id)
);

CREATE TABLE sortme.Sample (
    id SERIAL PRIMARY KEY,
    Problem_id INT NOT NULL REFERENCES sortme.Problem(id),
    "in" VARCHAR(2047),
    out VARCHAR(2047)
);

CREATE TABLE sortme.Subtask (
    id SERIAL PRIMARY KEY,
    Problem_id INT NOT NULL REFERENCES sortme.Problem(id),
    points INT NOT NULL,
    description VARCHAR(2047)
);

CREATE TABLE sortme.Subtask_Dependency (
    Subtask_id INT NOT NULL REFERENCES sortme.Subtask(id),
    Depends_on_id INT NOT NULL REFERENCES sortme.Subtask(id),
    PRIMARY KEY (Subtask_id, Depends_on_id)
);

CREATE TABLE sortme.Test (
    id SERIAL PRIMARY KEY,
    Subtask_id INT NOT NULL REFERENCES sortme.Subtask(id),
    "in" VARCHAR(2047),
    out VARCHAR(2047)
);

CREATE TABLE sortme.Category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE sortme.Problem_Categories (
    Problem_id INT NOT NULL REFERENCES sortme.Problem(id),
    Category_id INT NOT NULL REFERENCES sortme.Category(id),
    PRIMARY KEY (Problem_id, Category_id)
);

CREATE TABLE sortme.Submission (
    id SERIAL PRIMARY KEY,
    Problem_id INT NOT NULL REFERENCES sortme.Problem(id),
    User_id INT NOT NULL REFERENCES sortme.User(id),
    Lang_id INT NOT NULL REFERENCES sortme.Lang(id),
    submitted_at TIMESTAMP NOT NULL,
    code VARCHAR(2047),
    FOREIGN KEY (Problem_id, Lang_id) REFERENCES sortme.Problem_Langs(Problem_id, Lang_id)
);

CREATE TABLE sortme.Submission_Subtasks (
    Submission_id INT NOT NULL REFERENCES sortme.Submission(id),
    Subtask_id INT NOT NULL REFERENCES sortme.Subtask(id),
    worst_time INT NOT NULL,
    PRIMARY KEY (Submission_id, Subtask_id)
);

CREATE TABLE sortme.Fail_Verdict (
    id SERIAL PRIMARY KEY,
    text VARCHAR(255) NOT NULL
);

CREATE TABLE sortme.Submission_Failed_Tests (
    Test_id INT NOT NULL REFERENCES sortme.Test(id),
    Submission_id INT NOT NULL REFERENCES sortme.Submission(id),
    milliseconds INT NOT NULL,
    Fail_Verdict_id INT NOT NULL REFERENCES sortme.Fail_Verdict(id),
    PRIMARY KEY (Test_id, Submission_id)
);

