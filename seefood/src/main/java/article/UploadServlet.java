package article;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.microsoft.windowsazure.services.blob.client.CloudBlobClient;
import com.microsoft.windowsazure.services.blob.client.CloudBlobContainer;
import com.microsoft.windowsazure.services.blob.client.CloudBlockBlob;
import com.microsoft.windowsazure.services.core.storage.CloudStorageAccount;

@WebServlet("/js/article1.controller")
public class UploadServlet extends HttpServlet{
	 private static final long serialVersionUID = 1L;
     
	 public static final String storageConnectionString =
			    "DefaultEndpointsProtocol=http;" +
			    "AccountName=eeit9216;" +
			    "AccountKey=Nbx63AzfI2hOdCQbudIG31ZB8auJgD39ZRK32qXThaM6hT31Mfc4eW0g0/Nzg7xuXO3yq4C9Zc9sLKVI5UlRhw==;EndpointSuffix=core.windows.net";

	 
	    // 上传文件存储目录
	    private static final String UPLOAD_DIRECTORY = "upload";
	 
	    // 上传配置
	    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
	    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
	    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
	 
	    /**
	     * 上传数据及保存文件
	     */
	    protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	    	System.out.println("================來自UploadServlet.java的訊息================");
	    	if (!ServletFileUpload.isMultipartContent(request)) {
			    // 如果不是则停止
			    PrintWriter writer = response.getWriter();
			    writer.println("Error: 表单必须包含 enctype=multipart/form-data");
			    writer.flush();
			    return;
			}
	    	InputStream is = null;
	    	long sizeInBytes = 0;
	    	// 配置上传参数
	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
	        factory.setSizeThreshold(MEMORY_THRESHOLD);
	        // 设置临时存储目录
	        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	 
	        ServletFileUpload upload = new ServletFileUpload(factory);
	         
	        // 设置最大文件上传值
	        upload.setFileSizeMax(MAX_FILE_SIZE);
	         
	        // 设置最大请求值 (包含文件和表单数据)
	        upload.setSizeMax(MAX_REQUEST_SIZE);
			try
			{
			    // Retrieve storage account from connection-string.   和雲端連線
			    CloudStorageAccount storageAccount = CloudStorageAccount.parse(storageConnectionString);

			    // Create the blob client.							 說明要存到blob
			    CloudBlobClient blobClient = storageAccount.createCloudBlobClient();

			    // Retrieve reference to a previously created container.	尋找容器
			    CloudBlobContainer container = blobClient.getContainerReference("yousang");

			    // Define the path to a local file.
//			    final String filePath = "C:\\myimages\\myimage.jpg";

			    // Create or overwrite the "myimage.jpg" blob with contents from a local file.
			    List<FileItem> formItems = upload.parseRequest(request);
			    if (formItems != null && formItems.size() > 0){
			    	for (FileItem item : formItems) {
			    		if (!item.isFormField()) {
			    			String filename=UUID.randomUUID().toString()+LocalDateTime.now().toString();
			    			CloudBlockBlob blob = container.getBlockBlobReference(filename);
						    String path="https://eeit9216.blob.core.windows.net/yousang/"+filename;
						    is=item.getInputStream();
						    blob.upload(is, item.getSize());
						    request.setAttribute("message","圖片上傳成功!,請複製以下連結至<br>[影像資訊]的[URL]");
		                    request.setAttribute("filePath",path);
			    		}
			    	}
			    }
			   
//			    blob.upload(new FileInputStream(source), source.length());
			}
			catch (Exception e)
			{
			    // Output the stack trace.
				request.setAttribute("message",
	                    "錯誤訊息: " + e.getMessage());
			}
			getServletContext().getRequestDispatcher("/pages/article/message.jsp").forward(request, response);
//			response.sendRedirect(response.encodeRedirectURL("/pages/article/message.jsp#8"));
	    }
}
