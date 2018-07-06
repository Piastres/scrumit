-- begin SCRUMIT_CONTACT
alter table SCRUMIT_CONTACT add constraint FK_SCRUMIT_CONTACT_ON_STATUS foreign key (STATUS_ID) references SCRUMIT_CONTACTS_STATUS(ID)^
alter table SCRUMIT_CONTACT add constraint FK_SCRUMIT_CONTACT_ON_CITY foreign key (CITY_ID) references SCRUMIT_CITY(ID)^
create index IDX_SCRUMIT_CONTACT_ON_STATUS on SCRUMIT_CONTACT (STATUS_ID)^
create index IDX_SCRUMIT_CONTACT_ON_CITY on SCRUMIT_CONTACT (CITY_ID)^
-- end SCRUMIT_CONTACT

-- begin SCRUMIT_MEETING
alter table SCRUMIT_MEETING add constraint FK_SCRUMIT_MEETING_ON_SPRINT foreign key (SPRINT_ID) references SCRUMIT_SPRINT(ID)^
create index IDX_SCRUMIT_MEETING_ON_SPRINT on SCRUMIT_MEETING (SPRINT_ID)^
-- end SCRUMIT_MEETING

-- begin SCRUMIT_CHAT
alter table SCRUMIT_CHAT add constraint FK_SCRUMIT_CHAT_ON_SENDER foreign key (SENDER_ID) references SEC_USER(ID)^
create index IDX_SCRUMIT_CHAT_ON_SENDER on SCRUMIT_CHAT (SENDER_ID)^
-- end SCRUMIT_CHAT
-- begin SEC_USER
alter table SEC_USER add constraint FK_SEC_USER_ON_CONTACT foreign key (CONTACT_ID) references SCRUMIT_CONTACT(ID)^
create index IDX_SEC_USER_ON_CONTACT on SEC_USER (CONTACT_ID)^
-- end SEC_USER
-- begin SCRUMIT_TASK
alter table SCRUMIT_TASK add constraint FK_SCRUMIT_TASK_ON_PERFORMER foreign key (PERFORMER_ID) references SEC_USER(ID)^
alter table SCRUMIT_TASK add constraint FK_SCRUMIT_TASK_ON_TASK foreign key (TASK_ID) references SCRUMIT_TASK(ID)^
alter table SCRUMIT_TASK add constraint FK_SCRUMIT_TASK_ON_TOP foreign key (TOP_ID) references SCRUMIT_TASK(ID)^
alter table SCRUMIT_TASK add constraint FK_SCRUMIT_TASK_ON_SPRINT_BACKLOG foreign key (SPRINT_BACKLOG_ID) references SCRUMIT_SPRINT_BACKLOG(ID)^
create unique index IDX_SCRUMIT_TASK_UK_SHORTDESC on SCRUMIT_TASK (SHORTDESC) where DELETE_TS is null ^
create index IDX_SCRUMIT_TASK_ON_PERFORMER on SCRUMIT_TASK (PERFORMER_ID)^
create index IDX_SCRUMIT_TASK_ON_TASK on SCRUMIT_TASK (TASK_ID)^
create index IDX_SCRUMIT_TASK_ON_TOP on SCRUMIT_TASK (TOP_ID)^
create index IDX_SCRUMIT_TASK_ON_SPRINT_BACKLOG on SCRUMIT_TASK (SPRINT_BACKLOG_ID)^
-- end SCRUMIT_TASK
-- begin SCRUMIT_DEADLINES
alter table SCRUMIT_DEADLINES add constraint FK_SCRUMIT_DEADLINES_ON_TASK foreign key (TASK_ID) references SCRUMIT_TASK(ID)^
create index IDX_SCRUMIT_DEADLINES_ON_TASK on SCRUMIT_DEADLINES (TASK_ID)^
-- end SCRUMIT_DEADLINES
-- begin SCRUMIT_TRACKER
alter table SCRUMIT_TRACKER add constraint FK_SCRUMIT_TRACKER_ON_TASK foreign key (TASK_ID) references SCRUMIT_TASK(ID)^
create index IDX_SCRUMIT_TRACKER_ON_TASK on SCRUMIT_TRACKER (TASK_ID)^
-- end SCRUMIT_TRACKER
-- begin SCRUMIT_SPRINT
alter table SCRUMIT_SPRINT add constraint FK_SCRUMIT_SPRINT_ON_TEAM foreign key (TEAM_ID) references SCRUMIT_TEAM(ID)^
create index IDX_SCRUMIT_SPRINT_ON_TEAM on SCRUMIT_SPRINT (TEAM_ID)^
-- end SCRUMIT_SPRINT
-- begin SCRUMIT_SPRINT_BACKLOG
alter table SCRUMIT_SPRINT_BACKLOG add constraint FK_SCRUMIT_SPRINT_BACKLOG_ON_SPRINT foreign key (SPRINT_ID) references SCRUMIT_SPRINT(ID)^
create index IDX_SCRUMIT_SPRINT_BACKLOG_ON_SPRINT on SCRUMIT_SPRINT_BACKLOG (SPRINT_ID)^
-- end SCRUMIT_SPRINT_BACKLOG
-- begin SCRUMIT_LINK
alter table SCRUMIT_LINK add constraint FK_SCRUMIT_LINK_ON_TASK foreign key (TASK_ID) references SCRUMIT_TASK(ID)^
create index IDX_SCRUMIT_LINK_ON_TASK on SCRUMIT_LINK (TASK_ID)^
-- end SCRUMIT_LINK
-- begin SCRUMIT_COMMAND_TASK_LINK
alter table SCRUMIT_COMMAND_TASK_LINK add constraint FK_COMTAS_ON_TASK foreign key (TASK_ID) references SCRUMIT_TASK(ID)^
alter table SCRUMIT_COMMAND_TASK_LINK add constraint FK_COMTAS_ON_TEAM foreign key (COMMAND_ID) references SCRUMIT_TEAM(ID)^
-- end SCRUMIT_COMMAND_TASK_LINK
-- begin SCRUMIT_TASKS_FILE
alter table SCRUMIT_TASKS_FILE add constraint FK_SCRUMIT_TASKS_FILE_ON_TASK foreign key (TASK_ID) references SCRUMIT_TASK(ID)^
alter table SCRUMIT_TASKS_FILE add constraint FK_SCRUMIT_TASKS_FILE_ON_FILE foreign key (FILE_ID) references SYS_FILE(ID)^
create index IDX_SCRUMIT_TASKS_FILE_ON_TASK on SCRUMIT_TASKS_FILE (TASK_ID)^
create index IDX_SCRUMIT_TASKS_FILE_ON_FILE on SCRUMIT_TASKS_FILE (FILE_ID)^
-- end SCRUMIT_TASKS_FILE
-- begin SCRUMIT_TASK_DURATION
alter table SCRUMIT_TASK_DURATION add constraint FK_SCRUMIT_TASK_DURATION_ON_TASK foreign key (TASK_ID) references SCRUMIT_TASK(ID)^
create index IDX_SCRUMIT_TASK_DURATION_ON_TASK on SCRUMIT_TASK_DURATION (TASK_ID)^
-- end SCRUMIT_TASK_DURATION
-- begin SCRUMIT_TEAM
alter table SCRUMIT_TEAM add constraint FK_SCRUMIT_TEAM_ON_LEADER foreign key (LEADER_ID) references SEC_USER(ID)^
create index IDX_SCRUMIT_TEAM_ON_LEADER on SCRUMIT_TEAM (LEADER_ID)^
-- end SCRUMIT_TEAM
-- begin SCRUMIT_TEAM_PERFORMER_LINK
alter table SCRUMIT_TEAM_PERFORMER_LINK add constraint FK_TEAPER_ON_TEAM foreign key (TEAM_ID) references SCRUMIT_TEAM(ID)^
alter table SCRUMIT_TEAM_PERFORMER_LINK add constraint FK_TEAPER_ON_PERFORMER foreign key (PERFORMER_ID) references SEC_USER(ID)^
-- end SCRUMIT_TEAM_PERFORMER_LINK
-- begin SCRUMIT_MEETINGS_TASK
alter table SCRUMIT_MEETINGS_TASK add constraint FK_SCRUMIT_MEETINGS_TASK_ON_MEETING foreign key (MEETING_ID) references SCRUMIT_MEETING(ID)^
alter table SCRUMIT_MEETINGS_TASK add constraint FK_SCRUMIT_MEETINGS_TASK_ON_TASK foreign key (TASK_ID) references SCRUMIT_TASK(ID)^
create index IDX_SCRUMIT_MEETINGS_TASK_ON_MEETING on SCRUMIT_MEETINGS_TASK (MEETING_ID)^
create index IDX_SCRUMIT_MEETINGS_TASK_ON_TASK on SCRUMIT_MEETINGS_TASK (TASK_ID)^
-- end SCRUMIT_MEETINGS_TASK
-- begin SCRUMIT_SPRINT_TASK_LINK
alter table SCRUMIT_SPRINT_TASK_LINK add constraint FK_SPRTAS_ON_SPRINT foreign key (SPRINT_ID) references SCRUMIT_SPRINT(ID)^
alter table SCRUMIT_SPRINT_TASK_LINK add constraint FK_SPRTAS_ON_TASK foreign key (TASK_ID) references SCRUMIT_TASK(ID)^
-- end SCRUMIT_SPRINT_TASK_LINK
-- begin SCRUMIT_CONTACTS_SPECIALITY
alter table SCRUMIT_CONTACTS_SPECIALITY add constraint FK_SCRUMIT_CONTACTS_SPECIALITY_ON_CONTACT foreign key (CONTACT_ID) references SCRUMIT_CONTACT(ID)^
alter table SCRUMIT_CONTACTS_SPECIALITY add constraint FK_SCRUMIT_CONTACTS_SPECIALITY_ON_SPECIALITY foreign key (SPECIALITY_ID) references SCRUMIT_SPECIALITY(ID)^
create index IDX_SCRUMIT_CONTACTS_SPECIALITY_ON_CONTACT on SCRUMIT_CONTACTS_SPECIALITY (CONTACT_ID)^
create index IDX_SCRUMIT_CONTACTS_SPECIALITY_ON_SPECIALITY on SCRUMIT_CONTACTS_SPECIALITY (SPECIALITY_ID)^
-- end SCRUMIT_CONTACTS_SPECIALITY
