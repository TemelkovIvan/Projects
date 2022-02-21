package education.springboot.cloud;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class HttpRequestExecutor {
    private OkHttpClient httpClient;

    public HttpRequestExecutor() {
        this.httpClient = new OkHttpClient
                .Builder()
                .build();
    }

    public Response executeGetRequest(String url) throws IOException {
        Request request = new Request.Builder()
                .url(url)
                .get()
                .build();
        return this.httpClient
                .newCall(request)
                .execute();
    }
}
