package inatel.gorest;

import com.intuit.karate.junit5.Karate;

class goRest {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("gorest").relativeTo(getClass());
    }    

}
