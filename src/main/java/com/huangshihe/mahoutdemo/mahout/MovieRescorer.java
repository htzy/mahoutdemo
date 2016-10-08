package com.huangshihe.mahoutdemo.mahout;

import org.apache.mahout.cf.taste.impl.common.FastIDSet;
import org.apache.mahout.cf.taste.recommender.IDRescorer;

/**
 * Created by huang.shihe on 10/6/16.
 */
public class MovieRescorer implements IDRescorer {

    private final FastIDSet idSet;

    public MovieRescorer(FastIDSet idSet) {
        this.idSet = idSet;
    }

    @Override
    public double rescore(long id, double originalScore) {
        return isFiltered(id) ? Double.NaN : originalScore;
    }

    @Override
    public boolean isFiltered(long id) {
        return !idSet.contains(id);
    }
}
