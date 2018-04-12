
-- bank script of bank

-- 用户表
CREATE TABLE user
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    password VARCHAR(100),
    email VARCHAR(1000),
    enabled INT, --1 启用   0 禁用
    last_password_reset_date DATETIME,
    login_time DATETIME
);

--角色表
CREATE TABLE AUTHORITY
(
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    descn VARCHAR(100)
);

--用户-角色表
CREATE TABLE user_authority
(
    user_id BIGINT,
    authority_id BIGINT,
    CONSTRAINT ua_user_fk FOREIGN KEY (user_id) REFERENCES user (id),
    CONSTRAINT ua_authority_fk FOREIGN KEY (authority_id) REFERENCES authority (id)
);

--初始化数据------------------
--角色表
INSERT INTO employee.authority (id, name, descn) VALUES (1, 'ROLE_ADMIN', '系统管理员');
INSERT INTO employee.authority (id, name, descn) VALUES (2, 'ROLE_MANAGER', '经理');
INSERT INTO employee.authority (id, name, descn) VALUES (3, 'ROLE_CLERK', '办事员');

--用户表
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (1, 'admin', '$2a$10$Y0QP4dyLXgTghzlFHjsbxe3I.M9k.TTPduL4Vf0saRBmo/eMjAYsC', 'admin@gmail.com', 1, '2018-04-10 07:04:46', '2018-04-12 07:05:01');
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (2, 'king', '$2a$10$QosJ/o9iqDJADsbfjVRq9.7DgblPgsWXCU1tkd8kTHOLJ7I9GBBzy', 'king@gmail.com', 1, '2018-04-08 07:06:51', '2018-04-12 07:06:57');
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (3, 'smith', '$2a$10$RMN0wrFM.6bXtK4FHq5kPOPbmvX0H42qrtD5HtRg2TVSrpZWkvvzq', 'smith@gmail.com', 0, '2018-04-06 07:08:10', '2018-04-13 07:07:37');
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (4, 'jones', '$2a$10$n3d8Xfcoy2SSlYOfBfylDuB2vWvngELL8zS8XLN7FD5Z89B.4TH.W', 'jones@gmail.com', 1, '2018-04-05 07:08:16', '2018-04-12 07:08:21');
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (5, 'james', '$2a$10$niVvGE80g6SXb6.OZiTUDOdfwYBk7Zu.wjr0fkTBY0WQIPoqINvNG', 'james@gmail.com', 1, '2018-04-05 07:08:48', '2018-04-12 07:08:57');

--用户-角色表
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (1, 1);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (2, 1);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (3, 1);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (4, 2);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (5, 3);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (1, 2);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (1, 3);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (4, 3);
COMMIT ;