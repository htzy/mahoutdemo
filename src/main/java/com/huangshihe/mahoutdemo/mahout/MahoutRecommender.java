package com.huangshihe.mahoutdemo.mahout;

import com.huangshihe.mahoutdemo.util.Constants;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.IDRescorer;
import org.apache.mahout.cf.taste.recommender.ItemBasedRecommender;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by huang.shihe on 9/26/16.
 */
public class MahoutRecommender {

    private String fileName;

    public MahoutRecommender(String dataFileName) {
        this.fileName = dataFileName;
    }

    public MahoutRecommender() {
        // default dataFileName
        fileName = this.getClass().getResource("/data/ratings.dat").getFile();
    }

    public void demo() {
        try {
            // step:1 构建模型 2 计算相似度 3 查找k紧邻 4 构造推荐引擎
            DataModel model = new FileDataModel(new File(this.getClass().getResource("/data/hello.txt").getFile()));
            UserSimilarity similarity = new PearsonCorrelationSimilarity(model);
            UserNeighborhood neighborhood = new NearestNUserNeighborhood(2, similarity, model);
            Recommender recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);
            List<RecommendedItem> recommendations = recommender.recommend(1, 2);//为用户1推荐两个ItemID
            for (RecommendedItem recommendation : recommendations) {
                System.out.println(recommendation);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void newDemo() {
        try {
            DataModel model = new FileDataModel(new File(this.getClass().getResource("/data/ratings.dat").getFile()), "::");
            UserSimilarity similarity = new PearsonCorrelationSimilarity(model);
            UserNeighborhood neighborhood = new NearestNUserNeighborhood(2, similarity, model);
            Recommender recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);
            List<RecommendedItem> recommendedItems = recommender.recommend(1, 2);
            for (RecommendedItem recommendedItem : recommendedItems) {
                System.out.print("recommendedItem.getItemID() = " + recommendedItem.getItemID());
                System.out.println("recommendedItem.getValue() = " + recommendedItem.getValue());
            }
        } catch (IOException | TasteException e) {
            e.printStackTrace();
        }
    }

    public DataModel getFileDataModel() throws IOException {
        return new FileDataModel(new File(fileName), "::");
    }

    public DataModel getFileDataModel(String delimiterRegex) throws IOException {
        return new FileDataModel(new File(fileName), delimiterRegex);
    }

    public List<RecommendedItem> userBasedRecommender(int userId, int neighborhoodCount, int howMany) throws IOException, TasteException {
        DataModel model = getFileDataModel();
        UserSimilarity similarity = new PearsonCorrelationSimilarity(model);
        UserNeighborhood neighborhood = new NearestNUserNeighborhood(neighborhoodCount, similarity, model);
//        Recommender recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);
        // 构造推荐引擎，采用 CachingRecommender 为 RecommendationItem 进行缓存
        Recommender recommender = new CachingRecommender(new GenericUserBasedRecommender(model, neighborhood, similarity));
        return recommender.recommend(userId, howMany);
    }

    public List<RecommendedItem> itemBasedRecommender(int userId, int howMany) throws IOException, TasteException {
        DataModel model = getFileDataModel();
        // 计算内容相似度
        ItemSimilarity similarity = new PearsonCorrelationSimilarity(model);
        // 构造推荐引擎
        Recommender recommender = new CachingRecommender(new GenericItemBasedRecommender(model, similarity));
        return recommender.recommend(userId, howMany);
    }

    public List<RecommendedItem> itemBasedRecommender(int userId, int howMany, IDRescorer rescorer) throws IOException, TasteException {
        DataModel model = getFileDataModel();
        // 计算内容相似度
        ItemSimilarity similarity = new PearsonCorrelationSimilarity(model);
        // 构造推荐引擎
        Recommender recommender = new CachingRecommender(new GenericItemBasedRecommender(model, similarity));
        return recommender.recommend(userId, howMany, rescorer);
    }

    @Deprecated
    public List<RecommendedItem> itemBaseRecommender(int userId, int itemId, int howMany) throws IOException, TasteException {
        DataModel model = getFileDataModel();
        // TODO change similarity?
        ItemSimilarity similarity = new PearsonCorrelationSimilarity(model);
//        Recommender re =
        ItemBasedRecommender recommender = new GenericItemBasedRecommender(model, similarity);
        // TODO wrong function
        return recommender.recommendedBecause(userId, itemId, howMany);
    }

    /**
     * neighborhoodCount: min = 2, max = 20
     * howMany: 20
     *
     * @param userId loginUser.id
     * @return
     * @throws IOException
     * @throws TasteException
     */
    public List<RecommendedItem> getItemsBasedUser(int userId) throws IOException, TasteException {
        int length = (int) ((Math.random() + 2) * 10);
        return userBasedRecommender(userId, length, Constants.DEFAULT_ITEMS_LENGTH);
    }
}
