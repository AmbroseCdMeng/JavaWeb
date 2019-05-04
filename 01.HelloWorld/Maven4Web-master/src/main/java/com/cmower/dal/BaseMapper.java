package com.cmower.dal;

public interface BaseMapper<T extends DataEntity<T>, PKType extends java.io.Serializable> {

	PKType insert(T model);

	PKType delete(PKType modelPK);

	PKType update(T model);

	T select(PKType modelPK);
}
