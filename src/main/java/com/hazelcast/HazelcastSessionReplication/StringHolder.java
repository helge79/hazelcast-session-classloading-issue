package com.hazelcast.HazelcastSessionReplication;

import java.io.Serializable;

public class StringHolder implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private String value;

    public StringHolder() {
    }
    
    public StringHolder(String value) {
        setValue(value);
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
 
    @Override
    public String toString() {
        return this.value;
    }
}