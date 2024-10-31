#include <bits/stdc++.h>                           // 引入所有標準庫
#define INF 0x7fffffff                             // 定義無窮大
#define MAXN 100005                                // 定義最大節點數
#define eps 1e-9                                   // 定義精度
#define foru(a, b, c) for (int a = b; a <= c; a++) // 定義從 b 到 c 的循環
#define RT return 0;                               // 返回0的簡便定義
#define LL long long                               // 定義長整數類型
#define LXF int                                    // 定義整數類型
#define RIN rin()                                  // 簡化輸入函數的調用
#define HH printf("\n")                            // 簡化輸出換行
#define All(x) (x).begin(), (x).end()              // 簡化容器的遍歷
#define fi first                                   // 簡化 pair 的第一個元素
#define se second                                  // 簡化 pair 的第二個元素

using namespace std;

// 隱藏命令行輸出函數
void setConsoleCodePage() {
	// 使用重定向來隱藏輸出
	FILE *fp = _popen("chcp 65001", "r");
	if (fp) {
		_pclose(fp); // 關閉文件指標，清除輸出
	}
}

// 自定義輸入函數，支持讀取整數
inline LXF rin() {
	LXF x = 0, w = 1; // x 用來存數字，w 用來判斷符號
	char ch = 0;      // 定義字符變數 ch 用來讀取輸入
	while (ch < '0' || ch > '9') {
		// 當 ch 不是數字時
		if (ch == '-')
			w = -1;     // 如果是負號，w 設為 -1
		ch = getchar(); // 繼續讀取字符
	}
	while (ch >= '0' && ch <= '9') {
		// 讀取數字部分
		x = x * 10 + (ch - '0'); // 更新 x
		ch = getchar();          // 繼續讀取字符
	}
	return x * w; // 返回 x 乘以符號
}

// 檢查字串是否為英文字母
bool isAlpha(const string &name) {
	return all_of(name.begin(), name.end(), ::isalpha); // 驗證字串是否為英文字母
}

// 檢查字串長度是否符合限制
bool isValidContentName(const string &name) {
	return name.length() == 3 && isAlpha(name); // 驗證字串是否為 3 個字母
}

// 檢查字串是否為數字
bool isNumber(const string &str) {
	return all_of(str.begin(), str.end(), ::isdigit); // 驗證字串是否為數字
}

// 檢查字串是否為英文或數字
bool isAlphanumeric(const string &str) {
	return all_of(str.begin(), str.end(), [](char c) {
		return isalnum(c); // 檢查每個字符是否為英文字母或數字
	});
}

// 將字串中的 '\' 轉換為 '/'
void convertBackslashesToSlashes(string &path) {
	replace(path.begin(), path.end(), '\\', '/');
}

// 讀取Sleep時間
int readSleepTime(const string &prompt, int defaultValue1, int defaultValue2, int defaultValue3) {
	setConsoleCodePage();
	cout << prompt << endl;
	cout << "1. 預設值 " << defaultValue1 << " 毫秒" << endl;
	cout << "2. 預設值 " << defaultValue2 << " 毫秒" << endl;
	cout << "3. 預設值 " << defaultValue3 << " 毫秒" << endl;
	cout << "4. 請自行輸入一個數字" << endl;

	string input; // 用於讀取用戶的選擇
	int choice;
	while (true) {
		cout << "請選擇一個選項 (1-4): ";
		cin >> input;

		if (isNumber(input)) {
			choice = stoi(input);
			if (choice >= 1 && choice <= 3) {
				return (choice == 1 ? defaultValue1 : (choice == 2 ? defaultValue2 : defaultValue3));
			} else if (choice == 4) {
				cout << "請輸入自訂的 sleep 時間（毫秒）：";
				cin >> input;
				if (isNumber(input)) {
					return stoi(input);
				} else {
					cout << "無效的輸入，請輸入一個數字。" << endl;
				}
			} else {
				cout << "無效的選擇，請重新輸入。" << endl;
			}
		} else {
			cout << "無效的輸入，請輸入一個數字。" << endl;
		}
	}
}

// 主函數
signed main() {
	setConsoleCodePage();
	string TickerName;          // 用戶自訂的 Ticker 檔案名稱
	string TickerContentName;   // 用戶自訂的 Ticker 參數名稱
	string folderName;          // 用戶自訂的資料夾名稱
	string utilPath;            // 用戶自訂的路徑
	int sleepTime1, sleepTime2; // 定義兩個睡眠時間的變量
	char outputDone;            // 用於判斷是否輸出完成提示

	// 讓用戶輸入要生成的文件數量
	string fileCountInput; // 用於讀取文件數量的字符串
	int fileCount;
	cout << "請輸入要生成的文件數量：";
	while (true) {
		cin >> fileCountInput;
		if (isNumber(fileCountInput)) {
			fileCount = stoi(fileCountInput);
			if (fileCount > 0) {
				break; // 輸入有效，退出循環
			} else {
				cout << "無效的數量，請重新輸入一個大於 0 的數量：";
			}
		} else {
			cout << "無效的輸入，請輸入一個數字：";
		}
	}


	// 讀取 Ticker 檔案名稱
	cout << "請輸入 Ticker 的檔案名稱（英文）：";
	cin >> TickerName;
	while (!isAlpha(TickerName)) {
		// 驗證名稱是否有效
		cout << "無效的名稱，請重新輸入（英文）：";
		cin >> TickerName;
	}

	// 讀取 Ticker 參數名稱
	cout << "請輸入 Ticker 的參數名稱（3 個字母，英文）：";
	cin >> TickerContentName;
	while (!isValidContentName(TickerContentName)) {
		// 驗證名稱是否有效
		cout << "無效的名稱，請重新輸入（3 個字母，英文）：";
		cin >> TickerContentName;
	}

	// 讀取資料夾名稱
	cout << "請輸入資料夾名稱（僅限英文和數字）：";
	cin >> folderName;
	while (!isAlphanumeric(folderName)) {
		// 驗證資料夾名稱是否有效
		cout << "無效的資料夾名稱，請重新輸入（僅限英文和數字）：";
		cin >> folderName;
	}

	// 嘗試創建資料夾
	if (mkdir(folderName.c_str()) != 0) {
		cout << "資料夾已存在或創建失敗，將使用已存在的資料夾。" << endl;
	}

	// 讀取 util 路徑
	cout << "你的CFG資料夾/生成器位置" << "這樣CS2Konc_CFG/util\n";
	cout << "請輸入路徑：";
	cin >> utilPath;
	while (utilPath.empty()) {
		// 驗證路徑是否有效
		cout << "路徑不能為空，請重新輸入：";
		cin >> utilPath;
	}
	// 將 utilPath 中的 '\' 轉換為 '/'
	convertBackslashesToSlashes(utilPath);

	// 用戶自訂 sleep 時間
	sleepTime1 = readSleepTime("請選擇 sleep 的時間", 600000, 700000, 800000);
	sleepTime2 = readSleepTime("請選擇每次 sleep 的時間", 10, 9, 15);

	// 讓用戶選擇是否輸出完成提示
	while (true) {
		cout << "您希望輸出完成提示嗎？ (Y/N): ";
		cin >> outputDone;

		if (outputDone == 'y' || outputDone == 'Y' || outputDone == 'n' || outputDone == 'N') {
			break; // 如果輸入有效則退出循環
		} else {
			cout << "無效的輸入，請輸入 'Y' 或 'N'。" << endl;
		}
	}

	// 生成 1 到 fileCount 的文件
	foru(i, 1, fileCount) {
		// 打開對應的配置文件以寫入
		freopen((folderName + "/" + TickerName + to_string(i) + ".cfg").c_str(), "w", stdout);
		string TickerName_begin = TickerContentName + to_string(i); // 生成 Ticker 參數名稱

		// 生成 sleep 命令
		foru(j, 1, i - 1) {
			cout << "sleep " << sleepTime1 << "\n";
		}
		cout << (TickerName_begin + "_begin") << '\n'; // 輸出開始標記
		string out[2] = {TickerName_begin + "\n", "sleep " + to_string(sleepTime2) + "\n"}; // 預設輸出序列

		// 輸出 sleep sleepTime2 和 Ticker 內容的交替序列
		for (int k = 2; k <= 120001; k++) {
			cout << out[k & 1]; // 根據 k 的奇偶輸出不同的內容
		}

		// 根據用戶選擇輸出完成提示
		if (outputDone == 'y' || outputDone == 'Y') {
			cout << ("echo done " + TickerName_begin) << endl;
		}

		// 只在最後一個文件的最後一行寫入 "quit"
		if (i == fileCount) {
			cout << "quit" << endl;
		}
	}


	// 生成 Manager.cfg 檔案
	freopen((folderName + "/" + TickerName + "Manager.cfg").c_str(), "w", stdout);
	cout << "exec " << utilPath << "/" << folderName << "/" << TickerName << "Defines\n" << endl;
	cout << "sv_cheats 1" << endl;
	cout << "DontExecuteThisAgain\n" << endl;
	cout << "exec_async " << utilPath << "/" << folderName << "/" << TickerName << "Loading" << endl;
	cout << "sv_cheats 1" << endl;

	// 生成 Defines.cfg 檔案
	freopen((folderName + "/" + TickerName + "Defines.cfg").c_str(), "w", stdout);
	cout << "alias " << TickerContentName << " " << "\"\"" << endl;

	// 生成 Setup.cfg 檔案，檔案
	freopen((folderName + "/" + TickerName + "Setup.cfg").c_str(), "w", stdout);
	// 寫入 exec_async 指令
	foru(i, 1, fileCount) {
		cout << "exec_async " << utilPath << "/" << folderName << "/" << TickerName << i << endl;
	}

	// 生成 Loading.cfg 檔案
	freopen((folderName + "/" + TickerName + "Loading.cfg").c_str(), "w", stdout);
	// 輸出別名設定
	cout << "alias " << TickerContentName << "clear \""; // 這裡開始定義清除 alias
	foru(i, 1, fileCount) {
		cout << "alias " << TickerContentName << i << " " << "\"\";"; // 每個 alias 為 ""
		if (i < fileCount)
			cout << " "; // 最後一個 alias 後面不加空格
	}
	cout << "\"" << endl;
	// 輸出 alias tmpts
	cout << "\nalias tmpts \"echoln New Beginning " << TickerContentName << "\"" << "\n" << endl;
	// 輸出每個 ticker 的 begin alias
	foru(i, 1, fileCount) {
		cout << "alias " << TickerContentName << i << "_begin \"" << TickerContentName << "clear;alias " << TickerContentName << i << " " << TickerContentName << "; tmpts\"" << endl;
	}
	// 執行 Setup 檔案的
	cout << "\nexec_async " << utilPath << "/" << folderName << "/" << TickerName << "Setup" << endl;

	return 0;

}
