package com.huangshihe.mahoutdemo.model;

import com.huangshihe.mahoutdemo.model.base.BaseMovie;
import com.huangshihe.mahoutdemo.util.Constants;
import com.huangshihe.mahoutdemo.util.SqlUtil;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

import java.util.List;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Movie extends BaseMovie<Movie> {

    public Movie() {
    }

    public Movie(String title, String genres, int year) {
        setTitle(title);
        setGenres(genres);
        setYear(year);
    }

    public static final Movie dao = new Movie();

    public static Movie getMovie(long id) {
        return Movie.dao.findFirstByCache("movies", "movie_" + id, "select * from t_movie where id = ?", id);
    }

    public static Page getMovies(int pageNum) {
        return Movie.dao.paginateByCache("moviePages", "moviePage" + pageNum, pageNum, Constants.DEFAULT_PAGE_SIZE, "select *", "from t_movie");
    }

//    @Before(EvictInterceptor.class)
//    @CacheName("moviePages")
//    TODO EvictInterceptor can't work
    @Override
    public boolean update() {
//        super.update();
        CacheKit.removeAll("moviePages");
        return super.update();
    }

    public List<Movie> search() {
        boolean hasWhere = false;
        StringBuffer selectSql = new StringBuffer("select * from t_movie");
        if (getTitle() != null && !"".equals(getTitle())) {
            hasWhere = SqlUtil.appendWhereIfNeed(selectSql, hasWhere);
            selectSql.append("title like '%").append(getTitle()).append("%'");
        }
        if (getGenres() != null && !"".equals(getGenres())) {
            hasWhere = SqlUtil.appendWhereIfNeed(selectSql, hasWhere);
            selectSql.append("genres like '%").append(getGenres()).append("%'");
        }
        if (getYear() != null && getYear() != Constants.ALL_YEAR) {
            hasWhere = SqlUtil.appendWhereIfNeed(selectSql, hasWhere);
            selectSql.append("year = ").append(getYear());
        }
        return dao.find(selectSql.toString());
    }
}
