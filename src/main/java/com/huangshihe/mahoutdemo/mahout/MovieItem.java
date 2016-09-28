package com.huangshihe.mahoutdemo.mahout;

import com.huangshihe.mahoutdemo.model.Movie;
import com.huangshihe.mahoutdemo.util.Constants;

/**
 * Created by huang.shihe on 9/27/16.
 */
public class MovieItem {
    private long id;
    private String title;
    private String geners;
    private String url;
    private float value;

    public MovieItem(long itemID, float value) {
        this.id = itemID;
        this.value = value;
        Movie movie = Movie.getMovie(id);
        title = movie.getTitle();
        geners = movie.getGenres();
        if (movie.getUrl() == null || "".equals(movie.getUrl().trim())) {
            url = Constants.DEFAULT_MOVIE_BACKGROUND;
        }else{
            url = movie.getUrl();
        }

    }

    public String getGeners() {
        return geners;
    }

    public long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getUrl() {
        return url;
    }

    public float getValue() {
        return value;
    }

    @Override
    public String toString() {
        return "MovieItem{" +
                "geners='" + geners + '\'' +
                ", id=" + id +
                ", title='" + title + '\'' +
                ", url='" + url + '\'' +
                ", value=" + value +
                '}';
    }
}
