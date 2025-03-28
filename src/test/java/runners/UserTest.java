package runners;

import com.intuit.karate.junit5.Karate;

class UserTest {

    @Karate.Test
    Karate testUsers(){
        return Karate.run("classpath:features/users/create_user.feature").relativeTo(getClass());
    }
}
