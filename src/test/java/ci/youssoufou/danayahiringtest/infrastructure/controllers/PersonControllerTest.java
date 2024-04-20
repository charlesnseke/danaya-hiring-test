package ci.youssoufou.danayahiringtest.infrastructure.controllers;

import ci.youssoufou.danayahiringtest.domain.api.PersonService;
import ci.youssoufou.danayahiringtest.domain.dto.PersonDto;
import ci.youssoufou.danayahiringtest.domain.exceptions.PersonNotFound;
import ci.youssoufou.danayahiringtest.domain.spi.stubs.PersonStub;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.val;
import org.hamcrest.Matchers;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import java.util.ArrayList;
import java.util.stream.IntStream;

@WebMvcTest(PersonController.class)
@AutoConfigureMockMvc
class PersonControllerTest {

    private static final String BASE_URI = "/api/v1/persons";
    @MockBean
    PersonService personService;
    @Autowired
    MockMvc mockMvc;
    @Autowired
    ObjectMapper objectMapper;

    @Nested
    class TestCreatePerson {
        @Test
        void success_creation() throws Exception {
            // given
            var dto = PersonStub.createPersonDto("MOHAMED", "YOUSSOUFOU", "01-11-1960");
            var payload = objectMapper.writeValueAsString(dto);
            val responseExcepted = PersonStub.personDtoWithIdentity("MOHAMED", "YOUSSOUFOU", "01/11/1960");
            Mockito.when(personService.createNewPerson(dto)).thenReturn(responseExcepted);
            // when
            var response = mockMvc.perform(
                    MockMvcRequestBuilders.post(BASE_URI)
                            .content(payload)
                            .contentType(MediaType.APPLICATION_JSON)
            );
            // then
            response.andDo(MockMvcResultHandlers.print());
            response.andExpect(MockMvcResultMatchers.status().isCreated());
            response.andExpect(MockMvcResultMatchers.jsonPath("$.firstName").value("YOUSSOUFOU"));
            response.andExpect(MockMvcResultMatchers.jsonPath("$.lastName").value("MOHAMED"));
            response.andExpect(MockMvcResultMatchers.jsonPath("$.birthDate").value("01/11/1960"));
        }

        @Test
        void fail_creation() throws Exception {
            // given
            var dto = PersonStub.createPersonDto("MOHAMED", "YOUSSOUFOU", "01-11-1960");
            var payload = objectMapper.writeValueAsString(dto);
            Mockito.when(personService.createNewPerson(dto)).thenThrow(PersonNotFound.class);
            // when
            var response = mockMvc.perform(
                    MockMvcRequestBuilders.post(BASE_URI)
                            .content(payload)
                            .contentType(MediaType.APPLICATION_JSON)
            );
            // then
            response.andDo(MockMvcResultHandlers.print());
            response.andExpect(MockMvcResultMatchers.status().is4xxClientError());
        }
    }

    @Nested
    class TestGetPersons {
        @ParameterizedTest
        @CsvSource(value = {
                "0:2:2"
        }, delimiter = ':')
        void getPersons(int pageNumber, int pageSize, int sizeExcepted) throws Exception {
            // given
            var persons = new ArrayList<PersonDto>();
            IntStream.range(0, sizeExcepted).forEach(i -> persons.add(PersonStub.personDto("A" + i, "B" + i, "10-10-2000")));
            Mockito.when(personService.fetchPaginatePersons(pageNumber, pageSize)).thenReturn(persons);
            // when
            var response = mockMvc.perform(
                    MockMvcRequestBuilders.get(BASE_URI + "?pageSize=" + pageSize + "&pageNumber=" + pageNumber)
                            .contentType(MediaType.APPLICATION_JSON)
            );
            // then
            response.andDo(MockMvcResultHandlers.print());
            response.andExpect(MockMvcResultMatchers.status().isOk());
            response.andExpect(MockMvcResultMatchers.jsonPath("$", Matchers.hasSize(sizeExcepted)));
        }
    }

    @Nested
    class TestGetScore {

        @Test
        void success_find() throws Exception {
            // given
            var dto = PersonStub.createGetPersonDto("MOHAMED", "YOUSSOUFOU", "01-11-1960");
            val responseExcepted = PersonStub.createPersonScoreDto("MOHAMED", 100.0d, "YOUSSOUFOU", 100.0d, "01/11/1960", 1000d);
            Mockito.when(personService.verifyPersonExistenceAndCalculateEachFieldScore(dto)).thenReturn(responseExcepted);
            // when
            var response = mockMvc.perform(
                    MockMvcRequestBuilders.get(BASE_URI + "/getScore?identity=" + dto.getIdentity() + "&firstName=" + dto.getFirstName() + "&lastName=" + dto.getLastName() + "&birthDate=" + dto.getBirthDate())
                            .contentType(MediaType.APPLICATION_JSON)
            );
            // then
            response.andDo(MockMvcResultHandlers.print());
            response.andExpect(MockMvcResultMatchers.status().isOk());
            response.andExpect(MockMvcResultMatchers.jsonPath("$.firstNameWithScore.field").value("YOUSSOUFOU"));
            response.andExpect(MockMvcResultMatchers.jsonPath("$.firstNameWithScore.score").value(100.0d));
        }
    }
}