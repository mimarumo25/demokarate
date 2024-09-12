package test.category;

import com.intuit.karate.junit5.Karate;

public class CatgoryRunner {
    @Karate.Test
    Karate testGet(){
       return  Karate.run("category-get").relativeTo(getClass());
    }
}
