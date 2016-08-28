/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     28/8/2016 5:30:02 p. m.                      */
/*==============================================================*/


/*==============================================================*/
/* Table: EQUIPO                                                */
/*==============================================================*/
create table EQUIPO 
(
   ID_EQUIPO            integer                        not null,
   NOMBRE_EQUIPO        char(30)                       not null,
   INFO                 long varchar                   null,
   LOGO                 long binary                    null,
   constraint PK_EQUIPO primary key (ID_EQUIPO)
);

/*==============================================================*/
/* Index: EQUIPO_PK                                             */
/*==============================================================*/
create unique index EQUIPO_PK on EQUIPO (
ID_EQUIPO ASC
);

/*==============================================================*/
/* Table: ESTADISTICA                                           */
/*==============================================================*/
create table ESTADISTICA 
(
   ID_ESTADISTICA       integer                        not null,
   ID_USUARIO           integer                        null,
   FECHA_ESTADISTICA    char(15)                       not null,
   DISPOSITIVO          char(20)                       not null,
   PAGINA               char(20)                       not null,
   constraint PK_ESTADISTICA primary key (ID_ESTADISTICA)
);

/*==============================================================*/
/* Index: ESTADISTICA_PK                                        */
/*==============================================================*/
create unique index ESTADISTICA_PK on ESTADISTICA (
ID_ESTADISTICA ASC
);

/*==============================================================*/
/* Index: CONTIENE_FK                                           */
/*==============================================================*/
create index CONTIENE_FK on ESTADISTICA (
ID_USUARIO ASC
);

/*==============================================================*/
/* Table: FIXTURE                                               */
/*==============================================================*/
create table FIXTURE 
(
   ID_FIXTURE           integer                        not null,
   ID_USUARIO           integer                        null,
   NOMBRE_FIXTURE       char(30)                       not null,
   constraint PK_FIXTURE primary key (ID_FIXTURE)
);

/*==============================================================*/
/* Index: FIXTURE_PK                                            */
/*==============================================================*/
create unique index FIXTURE_PK on FIXTURE (
ID_FIXTURE ASC
);

/*==============================================================*/
/* Index: TIENEA_FK                                             */
/*==============================================================*/
create index TIENEA_FK on FIXTURE (
ID_USUARIO ASC
);

/*==============================================================*/
/* Table: JUGADOR                                               */
/*==============================================================*/
create table JUGADOR 
(
   ID_JUGADOR           integer                        not null,
   ID_EQUIPO            integer                        null,
   NOMBRE_JUGADOR       char(30)                       null,
   EDAD                 integer                        not null,
   NACIONALIDAD         char(30)                       null,
   constraint PK_JUGADOR primary key (ID_JUGADOR)
);

/*==============================================================*/
/* Index: JUGADOR_PK                                            */
/*==============================================================*/
create unique index JUGADOR_PK on JUGADOR (
ID_JUGADOR ASC
);

/*==============================================================*/
/* Index: USAA_FK                                               */
/*==============================================================*/
create index USAA_FK on JUGADOR (
ID_EQUIPO ASC
);

/*==============================================================*/
/* Table: MENSAJE                                               */
/*==============================================================*/
create table MENSAJE 
(
   ID_MENSAJE           integer                        not null,
   ID_USUARIO           integer                        null,
   FECHA_MENSAJE        char(15)                       null,
   CONTENIDO_MENSAJE    char(50)                       not null,
   constraint PK_MENSAJE primary key (ID_MENSAJE)
);

/*==============================================================*/
/* Index: MENSAJE_PK                                            */
/*==============================================================*/
create unique index MENSAJE_PK on MENSAJE (
ID_MENSAJE ASC
);

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create index PERTENECE_FK on MENSAJE (
ID_USUARIO ASC
);

/*==============================================================*/
/* Table: PARTIDO                                               */
/*==============================================================*/
create table PARTIDO 
(
   ID_PARTIDO           integer                        not null,
   ID_FIXTURE           integer                        null,
   FECHA_PARTIDO        char(15)                       null,
   LUGAR                char(25)                       null,
   constraint PK_PARTIDO primary key (ID_PARTIDO)
);

/*==============================================================*/
/* Index: PARTIDO_PK                                            */
/*==============================================================*/
create unique index PARTIDO_PK on PARTIDO (
ID_PARTIDO ASC
);

/*==============================================================*/
/* Index: PERTENECEA_FK                                         */
/*==============================================================*/
create index PERTENECEA_FK on PARTIDO (
ID_FIXTURE ASC
);

/*==============================================================*/
/* Table: PARTIDO_EQUIPO                                        */
/*==============================================================*/
create table PARTIDO_EQUIPO 
(
   ID_PARTIDO_EQUIPO    integer                        not null,
   ID_PARTIDO           integer                        null,
   ID_EQUIPO            integer                        null,
   GANADOR              smallint                       null,
   constraint PK_PARTIDO_EQUIPO primary key (ID_PARTIDO_EQUIPO)
);

/*==============================================================*/
/* Index: PARTIDO_EQUIPO_PK                                     */
/*==============================================================*/
create unique index PARTIDO_EQUIPO_PK on PARTIDO_EQUIPO (
ID_PARTIDO_EQUIPO ASC
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create index TIENE_FK on PARTIDO_EQUIPO (
ID_PARTIDO ASC
);

/*==============================================================*/
/* Index: USA_FK                                                */
/*==============================================================*/
create index USA_FK on PARTIDO_EQUIPO (
ID_EQUIPO ASC
);

/*==============================================================*/
/* Table: RESPUESTA                                             */
/*==============================================================*/
create table RESPUESTA 
(
   ID_RESPUESTA         integer                        not null,
   ID_MENSAJE           integer                        null,
   FECHA_RESPUESTA      char(15)                       null,
   CONTENIDO_RESPUESTA  char(50)                       not null,
   constraint PK_RESPUESTA primary key (ID_RESPUESTA)
);

/*==============================================================*/
/* Index: RESPUESTA_PK                                          */
/*==============================================================*/
create unique index RESPUESTA_PK on RESPUESTA (
ID_RESPUESTA ASC
);

/*==============================================================*/
/* Index: CONTIENEA_FK                                          */
/*==============================================================*/
create index CONTIENEA_FK on RESPUESTA (
ID_MENSAJE ASC
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO 
(
   ID_USUARIO           integer                        not null,
   CORREO               char(50)                       not null,
   TELEFONO             integer                        not null,
   CONTRASENA           char(50)                       not null,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

/*==============================================================*/
/* Index: USUARIO_PK                                            */
/*==============================================================*/
create unique index USUARIO_PK on USUARIO (
ID_USUARIO ASC
);

alter table ESTADISTICA
   add constraint FK_ESTADIST_CONTIENE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on update restrict
      on delete restrict;

alter table FIXTURE
   add constraint FK_FIXTURE_TIENEA_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on update restrict
      on delete restrict;

alter table JUGADOR
   add constraint FK_JUGADOR_USAA_EQUIPO foreign key (ID_EQUIPO)
      references EQUIPO (ID_EQUIPO)
      on update restrict
      on delete restrict;

alter table MENSAJE
   add constraint FK_MENSAJE_PERTENECE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on update restrict
      on delete restrict;

alter table PARTIDO
   add constraint FK_PARTIDO_PERTENECE_FIXTURE foreign key (ID_FIXTURE)
      references FIXTURE (ID_FIXTURE)
      on update restrict
      on delete restrict;

alter table PARTIDO_EQUIPO
   add constraint FK_PARTIDO__TIENE_PARTIDO foreign key (ID_PARTIDO)
      references PARTIDO (ID_PARTIDO)
      on update restrict
      on delete restrict;

alter table PARTIDO_EQUIPO
   add constraint FK_PARTIDO__USA_EQUIPO foreign key (ID_EQUIPO)
      references EQUIPO (ID_EQUIPO)
      on update restrict
      on delete restrict;

alter table RESPUESTA
   add constraint FK_RESPUEST_CONTIENEA_MENSAJE foreign key (ID_MENSAJE)
      references MENSAJE (ID_MENSAJE)
      on update restrict
      on delete restrict;

