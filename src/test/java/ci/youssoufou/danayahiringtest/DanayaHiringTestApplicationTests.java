package ci.youssoufou.danayahiringtest;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class DanayaHiringTestApplicationTests {

    @Autowired
    private DanayaHiringTestApplication app;

    @Test
    void contextLoads() {
        Assertions.assertNotNull(app);
    }

}
