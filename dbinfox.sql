create  database dbinfox;
use dbinfox;
create table tbusuarios(	
iduser int primary key,
usuario varchar(50) not null,
foneusuario varchar(15),
login varchar(15) unique not null,
senha varchar(15) not null
);
 	
describe tbusuarios;
insert into tbusuarios(iduser,usuario,foneusuario,login,senha)values(1,'Igors cardoso','999-999999','igors.cardoso','12345');
insert into tbusuarios(iduser,usuario,foneusuario,login,senha)values(2,'José Antonio','888-888888','jose.antonio','12345');
insert into tbusuarios(iduser,usuario,foneusuario,login,senha)values(3,'Administrador','777-888888','admin','admin');
select*from tbusuarios;	


create table tbclientes(
idcliente int primary key auto_increment,
nomecliente varchar(50) not null, 
enderecocliente varchar(100),
telefornecliente varchar(15), correio varchar(50)
);
alter table tbclientes change telefornecliente  telefonecliente varchar(15);
insert into tbclientes(nomecliente,enderecocliente,telefornecliente,correio)values('Linux Torvalds','Rua Tux','888-99999','linux@torvalds');
insert into tbclientes(nomecliente,enderecocliente,telefonecliente,correio)values('Bill Gates','Rua nova','999-888888','bill@gates');

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(50) not null,
problema varchar(150) not null,
servico varchar(150),
tecnico varchar(50),
valor decimal(10,2),
idcliente int not null,
foreign key (idcliente) references tbclientes(idcliente)
);
describe tbos;
insert tbos(equipamento,problema,servico,tecnico,valor,idcliente) values('Notbook','Não Liga','mudanca da fonte','José Francisco',60.50,1);
insert tbos(equipamento,problema,servico,tecnico,valor,idcliente) values('Notbook','Não Liga','mudanca da fonte','José Francisco',60.50,1);
select*from tbos;

select ordem.os,equipamento,problema,servico,valor, cliente.nomecliente,telefonecliente
from tbos as ordem
inner join tbclientes as cliente
on (ordem.idcliente = cliente.idcliente);