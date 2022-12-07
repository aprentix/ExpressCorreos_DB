use correosexpress;

/*LOS ALTER TABLE PARA INCLUIR LAS FOREIGN KEY*/
    
ALTER TABLE Paquete
	ADD FOREIGN KEY (id_ug_envia) REFERENCES UGenerico(id_ugenerico),
	ADD FOREIGN KEY (id_ug_recibe) REFERENCES UGenerico(id_ugenerico),
	ADD FOREIGN KEY (dni_cartero) REFERENCES Cartero(dni),
	ADD FOREIGN KEY (id_reparto) REFERENCES Reparto(id_reparto),
	ADD FOREIGN KEY (id_recogida) REFERENCES Recogida(recogidaId);
    
ALTER TABLE AreaEnvio
	ADD FOREIGN KEY(id_oficina) REFERENCES Oficina(codigo);
    
ALTER TABLE Calle
	ADD FOREIGN KEY (id_municipio) REFERENCES Municipio(id_municipio);

ALTER TABLE SegmentoCalle
	ADD FOREIGN KEY (id_calle) REFERENCES Calle(id_calle);
    
ALTER TABLE CentroClasificacion
	ADD FOREIGN KEY (id_municipio) REFERENCES Municipio(id_municipio);

ALTER TABLE Coche
	ADD FOREIGN KEY(codigo_oficina) REFERENCES Oficina(codigo);
    
ALTER TABLE Reparto
	ADD FOREIGN KEY (dni_cartero) REFERENCES Cartero(dni),
    ADD FOREIGN KEY (matricula) REFERENCES Coche(matricula),
    ADD FOREIGN KEY (id_ruta) REFERENCES Ruta(id);
    
ALTER TABLE Oficina
	ADD FOREIGN KEY (codigo_centro_clasificacion) REFERENCES CentroClasificacion(codigo),
    ADD FOREIGN KEY (id_municipio) REFERENCES Municipio(id_municipio);

ALTER TABLE Recogida
	ADD FOREIGN KEY (id_direccion) REFERENCES Direccion(id_direccion),
    ADD FOREIGN KEY (dni_uidentificado) REFERENCES UIdentificado(dni_uidentificado),
    ADD FOREIGN KEY (dni_cartero) REFERENCES Cartero(dni); 
    
ALTER TABLE UGenerico
	ADD FOREIGN KEY (id_direccion) REFERENCES Direccion(id_direccion);
    
ALTER TABLE Carta
	ADD FOREIGN KEY (id_UGenerico_envia) REFERENCES UGenerico(id_ugenerico),
	ADD FOREIGN KEY (id_UGenerico_recibe) REFERENCES UGenerico(id_ugenerico),
	ADD FOREIGN KEY (id_Reparto) REFERENCES Reparto(id_reparto);

ALTER TABLE Direccion
	ADD FOREIGN KEY (id_calle) REFERENCES Calle(id_calle);
    
ALTER TABLE CartaCertificada
	ADD FOREIGN KEY (dni_ui_recibe) REFERENCES UIdentificado(dni_uidentificado),
    ADD FOREIGN KEY (dni_ui_envia) REFERENCES UIdentificado(dni_uidentificado),
    ADD FOREIGN KEY (id_reparto) REFERENCES Reparto(id_reparto);
    
/* Tablas N:M */

ALTER TABLE UIdentificado_vive_en_direccion 
	ADD FOREIGN KEY (id_direccion) REFERENCES Direccion(id_direccion),
    ADD FOREIGN KEY (dni_uidentificado) REFERENCES UIdentificado(dni_uidentificado);
    
ALTER TABLE area_envio_incluye_segmento_calle
	ADD FOREIGN KEY(id_area_envio) REFERENCES AreaEnvio(id_area_envio),
	ADD FOREIGN KEY(n_Segmento) REFERENCES SegmentoCalle(n_Segmento);
    
ALTER TABLE ruta_incluye_segmento
	ADD FOREIGN KEY(id_ruta) REFERENCES Ruta(id),
    ADD FOREIGN KEY(n_segmento) REFERENCES SegmentoCalle(n_Segmento);
    
ALTER TABLE cartero_reparte_en_area_envio
	ADD FOREIGN KEY(dni_cartero) REFERENCES Cartero(dni),
	ADD FOREIGN KEY(id_area_envio) REFERENCES AreaEnvio(id_area_envio);
    
/* TERNARIAS */

ALTER TABLE Trabaja
	ADD FOREIGN KEY(dniC) REFERENCES Cartero(dni),
    ADD FOREIGN KEY(codOf) REFERENCES Oficina(codigo),
    ADD FOREIGN KEY(jornadaT) REFERENCES Turno(jornada);

ALTER TABLE EntregaCertificada
	ADD FOREIGN KEY (dniC) REFERENCES Cartero(dni),
    ADD FOREIGN KEY (cartacertId) REFERENCES CartaCertificada(id_carta_certificada),
    ADD FOREIGN KEY (uidentificadoId) REFERENCES UIdentificado(dni_uidentificado);