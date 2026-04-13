package examples.postAuth;

import com.intuit.karate.junit5.Karate;

class   PostAuthRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("postAuth").relativeTo(getClass());
    }

}