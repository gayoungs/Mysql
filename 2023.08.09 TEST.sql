create table business (
	bn_id varchar(20),
    bn_pw varchar(20),
    bn_name varchar(40),
    bn_title varchar(50),
    bn_num varchar(50),
    bn_phone varchar (30)    
);

select * from business;
##############################################
create table lodgment (
	lodg_num int primary key auto_increment,
    lodg_type varchar(20),
    lodg_name varchar(40),
    lodg_rg varchar(40),
    lodg_addr varchar(200),
    lodg_img_filename varchar(100),
    lodg_img_filepath varchar(100),
    lodg_img_uuid varchar(100),
    lodg_ph varchar (30),
    lodg_content varchar(1000),
    bn_id varchar(20)
);







