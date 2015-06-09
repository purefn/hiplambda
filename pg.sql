CREATE TYPE weekday AS ENUM ('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

CREATE TABLE naggy_reminders (
  id                       char(36) NOT NULL,
  oauthId                  char(36) NOT NULL REFERENCES hipbot (oauthId),
  roomId                   integer NOT NULL,
  time                     time NOT NULL,
  timezone                 varchar(25) NOT NULL,
  every                    integer DEFAULT 1,
  weekdays                 weekday[] NOT NULL,
  mtype                    char(4) NOT NULL,
  message                  text NOT NULL,
  PRIMARY KEY(oauthId,id)
);
