-- audb.oauth_access_token definition

    create table oauth_access_token (
                                          token_id varchar(256) default null,
                                          token bytea,
                                          authentication_id varchar(128) not null,
                                          user_name varchar(256) default null,
                                          client_id varchar(256) default null,
                                          authentication bytea,
                                          refresh_token varchar(256) default null,
                                          primary key (authentication_id)
    );
-- audb.oauth_approvals definition

    create table oauth_approvals (
                                       user_id int default null,
                                       client_id varchar(256) default null,
                                       scope varchar(256) default null,
                                       status varchar(10) default null,
                                       expiresAt timestamp null default null,
                                       lastModifiedAt timestamp null default null
    );
-- audb.oauth_client_details definition

    create table oauth_client_details (
                                            client_id varchar(128) not null,
                                            client_secret varchar(255) not null,
                                            web_server_redirect_uri varchar(2048) default null,
                                            scope varchar(255) default null,
                                            access_token_validity int default null,
                                            refresh_token_validity int default null,
                                            resource_ids varchar(1024) default null,
                                            authorized_grant_types varchar(1024) default null,
                                            authorities varchar(1024) default null,
                                            additional_information varchar(4096) default null,
                                            autoapprove varchar(255) default null,
                                            primary key (client_id)
    );
-- audb.oauth_client_token definition

    create table oauth_client_token (
                                          token_id varchar(256) default null,
                                          token bytea,
                                          authentication_id varchar(128) not null,
                                          user_name varchar(256) default null,
                                          client_id varchar(256) default null,
                                          primary key (authentication_id)
    );
-- audb.oauth_code definition

    create table oauth_code (
                                  code varchar(256) default null,
                                  authentication bytea
    );
-- audb.oauth_refresh_token definition

    create table oauth_refresh_token (
                                           token_id varchar(128) default null,
                                           token bytea,
                                           authentication bytea
    );
-- audb.user definition

    create table user_info (
                            id BIGSERIAL  not null,
                            username varchar(100) not null UNIQUE,
                            password varchar(100) not null,
                            email varchar(100) not null,
                            enabled int not null,
                            account_non_expired int not null,
                            credentials_non_expired int not null,
                            account_non_locked int not null,
                            first_name varchar(100) default null,
                            last_name varchar(100) default null,
                            deleted int default null,
                            primary key (id)
    );
-- audb.role definition
    create table role (
                            id BIGSERIAL not null ,
                            name varchar(255) not null UNIQUE,
                            code varchar(255) not null UNIQUE,
                            description varchar(255) default null,
                            remark varchar(255) default null,
                            primary key (id)

    );
-- audb.role_permission definition

    create table role_permission (
                                       role_id int not null,
                                       permission_id int not null,
                                       primary key (role_id, permission_id)

    );
-- audb.permission definition

    create table permission (
                                  id BIGSERIAL not null ,
                                  name varchar(100) not null,
                                  description varchar(200) not null,
                                  primary key (id)
    );
-- audb.verification_token definition

    create table verification_token (
                                          id BIGSERIAL not null ,
                                          type varchar(25) not null,
                                          token varchar(250) default null,
                                          expiry_date timestamp null default null,
                                          used_at timestamp null default null,
                                          primary key (id)
    );
-- audb.role_user definition

 create table role_user (
                                     role_id int default null,
                                     user_id int default null
);
