package com.huangshihe.mahoutdemo.mahout;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by huang.shihe on 9/28/16.
 */
public class MahoutManage {

    public List<MovieItem> getMovieItems(int userId){
        MahoutRecommender recommender = new MahoutRecommender();
        List<MovieItem> items = new ArrayList<MovieItem>();
        List<RecommendedItem> recommendedItems = null;
        try {
            recommendedItems = recommender.getItemsBasedUser(userId);
        } catch (IOException | TasteException e) {
            e.printStackTrace();
        }
        if (recommendedItems != null) {
            items.addAll(recommendedItems.stream().map(recommendedItem -> new MovieItem(recommendedItem.getItemID(), recommendedItem.getValue())).collect(Collectors.toList()));
        }
        return items;
    }
}
