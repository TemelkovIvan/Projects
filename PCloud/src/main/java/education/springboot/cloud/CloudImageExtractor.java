package education.springboot.cloud;

import com.google.gson.Gson;
import org.springframework.stereotype.Component;

import java.awt.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Component
public class CloudImageExtractor {

    private static final String PICTURE_FOLDER_ID = "2403011229";
    private static final String QUERY_PATH_SEPARATOR = "?";
    private static final String QUERY_PARAMETER_SEPARATOR = "&";
    private static final String FOLDER_ID_PARAMETER = "folderid=";
    private static final String FILE_ID_PARAMETER = "fileid=";
    private static final String AUTH_PARAMETER = "auth=";
    private static final String CODE_PARAMETER = "code=";

    private static final String LIST_FOLDER_URL =
            "https://eapi.pcloud.com/listfolder";

    private static final String LIST_FILE_URL =
            "https://eapi.pcloud.com/getfilepublink";

    private static final String DOWNLOAD_FILE_URL =
            "https://eapi.pcloud.com/getpublinkdownload";

    private final HttpRequestExecutor httpRequestExecutor;

    private final CloudAuthorizationService cloudAuthorizationService;

    public CloudImageExtractor(HttpRequestExecutor httpRequestExecutor, CloudAuthorizationService cloudAuthorizationService) {
        this.httpRequestExecutor = httpRequestExecutor;
        this.cloudAuthorizationService = cloudAuthorizationService;
    }

    public String getImage(String name) throws IOException {

        Gson gson = new Gson();

        String url = "https://evc264.pcloud.com/dHZiWRwXFZfMmPyLZMfq5ZZ7TVNi7Z3VZZfb0ZkZIOtpZhKfTjFBjymfUYOU9UdN6UmahdiG7/user.png";

        String accessToken = this.cloudAuthorizationService.getAccessToken();

        String folderJsonResult = this.httpRequestExecutor.executeGetRequest(
                LIST_FOLDER_URL
                + QUERY_PATH_SEPARATOR
                + FOLDER_ID_PARAMETER
                + PICTURE_FOLDER_ID
                + QUERY_PARAMETER_SEPARATOR
                + AUTH_PARAMETER
                + accessToken
        ).body().string();

        Map<String, Object> folderData = gson.fromJson(folderJsonResult, Map.class);

        ArrayList<Map<String,Object>> filesData = (ArrayList<Map<String,Object>>) ((Map<String, Object>) folderData.get("metadata")).get("contents");

        for (Map<String, Object> singleFileData : filesData) {

            String fileId = singleFileData.get("id").toString().substring(1);

            String fileListJsonResult = this.httpRequestExecutor.executeGetRequest(
                    LIST_FILE_URL
                            + QUERY_PATH_SEPARATOR
                            + FILE_ID_PARAMETER
                            + fileId
                            + QUERY_PARAMETER_SEPARATOR
                            + AUTH_PARAMETER
                            + accessToken
            ).body().string();

            String fileCode = gson.fromJson(fileListJsonResult, Map.class).get("code").toString();

            String fileDownloadJsonResult = this.httpRequestExecutor.executeGetRequest(
                    DOWNLOAD_FILE_URL
                            + QUERY_PATH_SEPARATOR
                            + CODE_PARAMETER
                            + fileCode
            ).body().string();

            Map<String, Object> fileDownloadData = gson.fromJson(fileDownloadJsonResult, Map.class);

            String filePath = fileDownloadData.get("path").toString();

            String host = ((ArrayList<String>) fileDownloadData.get("hosts")).get(0);

            String fileName = singleFileData.get("name").toString();
            String fileUrl = "https://" + host + filePath;

            if (Objects.equals(fileName, name + ".jpg")) {
                url = fileUrl;
            }
        }
        return url;
    }
}
