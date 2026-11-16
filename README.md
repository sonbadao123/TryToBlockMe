# TryToBlockMe - Bộ công cụ Fix triệt để lỗi Steam bị chặn tại Việt Nam

Giải pháp vượt chặn Steam (Store, Community, Friends & Chat) dành riêng cho mạng Việt Nam (Viettel, VNPT, FPT) **100% Direct Connection**:
- **KHÔNG** dùng VPN, không đổi IP máy tính.
- **KHÔNG** làm tăng ping khi chơi game (ping 0ms loss, direct route).
- **KHÔNG** bị lỗi "Không có kết nối" ở thanh trạng thái hoặc lỗi trắng trang CSS Fastly.

---

## 🎯 Các lỗi thường gặp khi dùng Steam tại Việt Nam
1. **Mã lỗi: -101 (ERR_CONNECTION_RESET)**: Không thể kết nối tới máy chủ Cửa hàng Steam.
2. **"KHÔNG CÓ KẾT NỐI" (No Connection)**: Cửa hàng có thể vào được nhưng ở dưới đáy client và mục Bạn bè/Chat báo offline (Do DNS IPv6 của modem nhà mạng trả về `127.0.0.1` đầu độc máy chủ auth).
3. **"Unable to preload CSS for store.fastly.steamstatic.com"**: Giao diện bị vỡ hạt, đen màn hình do các bộ DPI thông thường làm gãy kết nối CDN Fastly của Valve.

---

## 🚀 Hướng dẫn cài đặt nhanh (Dành cho bạn bè)

### Cách 1: Cài đặt tự động chạy ngầm (Khuyên dùng - 1 Click là xong)
1. Tải toàn bộ thư mục này về máy tính (bấm **Code -> Download ZIP** rồi giải nén).
2. Vào thư mục vừa giải nén, nhấp đúp chuột vào file:
   ```text
   1_Cai_Dat_Tu_Dong.cmd
   ```
3. Khi Windows hiện hộp thoại cấp quyền (User Account Control), bấm **Yes**.
4. Script sẽ tự động:
   - Đặt DNS Google/Cloudflare sạch cho cả IPv4 và IPv6 (chặn đứng trò đầu độc DNS của nhà mạng).
   - Xóa bộ nhớ đệm DNS cũ (`ipconfig /flushdns`).
   - Cài đặt dịch vụ chạy ngầm GoodbyeDPI với **Mode -1** (Chế độ tương thích tối đa, hỗ trợ đầy đủ CDN Fastly và Akamai của Steam).
5. **Thoát hoàn toàn Steam** (Chuột phải icon Steam ở khay hệ thống góc phải màn hình -> Chọn *Thoát Steam*) rồi mở lại Steam. Tận hưởng!

---

### Cách 2: Chạy tạm thời (Khi nào chơi Steam mới bật)
- Nhấp đúp chuột vào file: `2_Chay_Nhanh_Khong_Cai_Dat.cmd`.
- Bấm **Yes** khi hỏi quyền Admin.
- Thu nhỏ cửa sổ CMD xuống thanh taskbar và mở Steam dùng bình thường.

---

### Khi muốn gỡ bỏ hoàn toàn:
- Nhấp đúp chuột vào file: `4_Go_Cai_Dat.cmd` để gỡ sạch dịch vụ và driver khỏi Windows.

---

## ⚙️ Cơ chế kỹ thuật (Dành cho ai muốn tìm hiểu)
- **Tầng DNS**: Sử dụng script PowerShell tự động ép DNS của tất cả adapter mạng đang hoạt động sang IPv4 (`8.8.8.8`, `1.1.1.1`) và IPv6 (`2001:4860:4860::8888`, `2001:4860:4860::8844`). Loại bỏ hoàn toàn tình trạng modem ISP trả về `127.0.0.1` cho các domain `*.cm.steampowered.com` và `steam-chat.com`.
- **Tầng DPI (WinDivert)**: GoodbyeDPI Mode `-1` phân mảnh gói tin ClientHello TLS xuôi theo tiêu chuẩn RFC, khiến thiết bị Deep Packet Inspection của ISP không nhận diện được SNI bị chặn mà không kích hoạt cơ chế chống đảo gói (anti-reverse frag) của máy chủ Fastly CDN.
