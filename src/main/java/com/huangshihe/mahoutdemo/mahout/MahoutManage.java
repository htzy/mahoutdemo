package com.huangshihe.mahoutdemo.mahout;

import com.huangshihe.mahoutdemo.model.Movie;
import com.huangshihe.mahoutdemo.util.Constants;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.eval.RecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.common.FastIDSet;
import org.apache.mahout.cf.taste.impl.eval.AverageAbsoluteDifferenceRecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.eval.RMSRecommenderEvaluator;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.IDRescorer;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.apache.mahout.common.RandomUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by huang.shihe on 9/28/16.
 */
public class MahoutManage {

    public List<MovieItem> getMovieItems(int userId) {
        MahoutRecommender recommender = new MahoutRecommender();
        List<MovieItem> items = new ArrayList<MovieItem>();
        List<RecommendedItem> recommendedItems = null;
        try {
            recommendedItems = recommender.getItemsBasedUser(userId);
        } catch (IOException | TasteException e) {
            e.printStackTrace();
        }
        if (recommendedItems != null) {
            items.addAll(recommendedItems.stream().map(
                    recommendedItem -> new MovieItem(recommendedItem.getItemID(), recommendedItem.getValue()))
                    .collect(Collectors.toList()));
        }
        return items;
    }

    public List<MovieItem> getMovieItems(int userId, Movie searchMovie) {
        MahoutRecommender recommender = new MahoutRecommender();
        List<MovieItem> items = new ArrayList<MovieItem>();
        List<RecommendedItem> recommendedItems = null;
        FastIDSet fastIDSet = new FastIDSet();
//        for (Movie movie : searchMovie.search()) {
//            fastIDSet.add(movie.getId());
//        }
        searchMovie.search().stream().forEach(movie -> fastIDSet.add(movie.getId()));
        IDRescorer rescorer = new MovieRescorer(fastIDSet);
        try {
            recommendedItems = recommender.itemBasedRecommender(userId, Constants.DEFAULT_ITEMS_LENGTH, rescorer);
        } catch (IOException | TasteException e) {
            e.printStackTrace();
        }
        if(recommendedItems != null){
            items.addAll(recommendedItems.stream().map(
                    recommendedItem -> new MovieItem(recommendedItem.getItemID(), recommendedItem.getValue()))
                    .collect(Collectors.toList()));
        }
        return items;
    }

    public double averageAbsoluteDifferenceRecommenderEvaluator() {
        MahoutRecommender recommender = new MahoutRecommender();

        RandomUtils.useTestSeed();
        DataModel dataModel = null;
        try {
            dataModel = recommender.getFileDataModel();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 推荐评估，使用平均差值
        RecommenderEvaluator evaluator = new AverageAbsoluteDifferenceRecommenderEvaluator();
        RecommenderBuilder builder = new RecommenderBuilder() {

            public Recommender buildRecommender(DataModel dataModel)
                    throws TasteException {
                UserSimilarity similarity = new PearsonCorrelationSimilarity(dataModel);
                UserNeighborhood neighborhood = new NearestNUserNeighborhood(2, similarity, dataModel);
                return new GenericUserBasedRecommender(dataModel, neighborhood,
                        similarity);
            }
        };
        //1.0表示待评估的数据集与总数据集的占比，1.0表示100%。 0.7表示训练数据集在评估数据集的占比
        double score = 0;
        try {
            score = evaluator.evaluate(builder, null, dataModel, 0.7, 1.0);
        } catch (TasteException e) {
            e.printStackTrace();
        }
        return score;
    }

    public double rMSRecommenderEvaluator() {
        MahoutRecommender recommender = new MahoutRecommender();

        RandomUtils.useTestSeed();
        DataModel dataModel = null;
        try {
            dataModel = recommender.getFileDataModel();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //推荐评估，使用均方根
        RecommenderEvaluator evaluator = new RMSRecommenderEvaluator();
        RecommenderBuilder builder = new RecommenderBuilder() {

            public Recommender buildRecommender(DataModel dataModel)
                    throws TasteException {
                UserSimilarity similarity = new PearsonCorrelationSimilarity(dataModel);
                UserNeighborhood neighborhood = new NearestNUserNeighborhood(2, similarity, dataModel);
                return new GenericUserBasedRecommender(dataModel, neighborhood,
                        similarity);
            }
        };
        //1.0表示待评估的数据集与总数据集的占比，1.0表示100%。 0.7表示训练数据集在评估数据集的占比
        double score = 0;
        try {
            score = evaluator.evaluate(builder, null, dataModel, 0.7, 1.0);
        } catch (TasteException e) {
            e.printStackTrace();
        }
        return score;
    }
}
