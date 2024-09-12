package test;

import com.intuit.karate.junit5.Karate;

public class ProductoRunner {
    @Karate.Test
    Karate testGet(){
        return  Karate.run("product-get").relativeTo(getClass());
    }
}