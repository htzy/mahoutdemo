package com.huangshihe.mahoutdemo.mahout;

import com.huangshihe.mahoutdemo.model.Movie;
import junit.framework.TestCase;
import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.NullRescorer;
import org.apache.mahout.cf.taste.impl.similarity.CityBlockSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.IDRescorer;
import org.apache.mahout.cf.taste.recommender.ItemBasedRecommender;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;

import java.util.List;

/**
 * Created by huang.shihe on 10/6/16.
 */
public class MahoutRecommenderTest extends TestCase {

    public void setUp() throws Exception {
        super.setUp();
    }

    public void tearDown() throws Exception {
        super.tearDown();
    }

//    public void testItemBaseRecommender() throws Exception {
//        MahoutRecommender mahoutRecommender = new MahoutRecommender(this.getClass().getResource("/data/hello.txt").getFile());
//        DataModel model = mahoutRecommender.getFileDataModel(",");
////        ItemSimilarity similarity = new CityBlockSimilarity(model);
//        ItemSimilarity similarity = new PearsonCorrelationSimilarity(model);
//
//
////        Recommender re =
//        ItemBasedRecommender recommender1 = new GenericItemBasedRecommender(model, similarity);
////        List<RecommendedItem> recommendedItems = recommender.recommendedBecause(1, 103, 7);
//        List<RecommendedItem> recommendedItems = recommender1.mostSimilarItems(102, 7);
//        for (RecommendedItem recommendedItem : recommendedItems) {
//            System.out.print("recommendedItem.getItemID() = " + recommendedItem.getItemID());
//            System.out.println(" recommendedItem.getValue() = " + recommendedItem.getValue());
//        }
//
//        /////////////////////////
//        // TODO ??GenericItemBasedRecommender.MostSimilarEstimator??
////        Recommender recommender = new GenericItemBasedRecommender.MostSimilarEstimator(102, similarity, rescorer);
//        Recommender recommender = new GenericItemBasedRecommender(model, similarity);
////        IDRescorer filterRescorer = new FilterRescorer();
////        recommendedItems = recommender.recommend(1, 7, filterRescorer);
//        for (RecommendedItem recommendedItem : recommendedItems) {
//            System.out.print("1recommendedItem.getItemID() = " + recommendedItem.getItemID());
//            System.out.println(" recommendedItem.getValue() = " + recommendedItem.getValue());
//        }
//
//        recommendedItems = recommender.recommend(1, 7);
//        for (RecommendedItem recommendedItem : recommendedItems) {
//            System.out.print("2recommendedItem.getItemID() = " + recommendedItem.getItemID());
//            System.out.println(" recommendedItem.getValue() = " + recommendedItem.getValue());
//        }
//    }
}