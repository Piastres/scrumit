create table SCRUMIT_TRACKER_FILE_DESCRIPTOR_LINK (
    TRACKER_ID uuid,
    FILE_DESCRIPTOR_ID uuid,
    primary key (TRACKER_ID, FILE_DESCRIPTOR_ID));
