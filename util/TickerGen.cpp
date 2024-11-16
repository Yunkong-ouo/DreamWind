#include <bits/stdc++.h>
#include <sys/stat.h>
#include <direct.h>

#define INF 0x7fffffff
#define MAXN 100005
#define eps 1e-9
#define foru(a, b, c) for (int a = b; a <= c; a++)
#define RT return 0;
#define LL long long
#define LXF int
#define HH printf("\n")
#define All(x) (x).begin(), (x).end()
#define fi first
#define se second

using namespace std;

// 隱藏命令行輸出函數
void setConsoleCodePage()
{
	FILE *fp = _popen("chcp 65001", "r");
	if (fp)
	{
		_pclose(fp);
	}
}

// 自定義輸入函數，支持讀取整型
inline LXF rin()
{
	LXF x = 0, w = 1;
	char ch;

	while (true)
	{
		ch = getchar();
		if (ch == EOF)
			return 0; // 確保不會在文件結尾時進入無窮迴圈

		if (ch < '0' || ch > '9')
		{
			if (ch == '-')
				w = -1; // 處理負數
			else if (ch != '\n')
			{
				cout << "無效輸入，請輸入整數：";
				while (getchar() != '\n')
					;	  // 清空輸入緩衝區
				continue; // 重試輸入
			}
		}
		else
		{
			// 開始累加數字
			x = x * 10 + (ch - '0');
			// 繼續讀取後續字符
			while (true)
			{
				ch = getchar();
				if (ch >= '0' && ch <= '9')
				{
					x = x * 10 + (ch - '0');
				}
				else
				{
					break;
				}
			}
			return x * w; // 返回整數
		}
	}
}

// 檢查字串是否僅包含英文字母和數字，且開頭為英文字母
bool isValidFileName(const string &str)
{
	if (str.empty() || !isalpha(str[0]))
		return false; // 檢查開頭是否為英文字母

	for (char ch : str)
	{
		if (!isalnum(ch))
		{
			return false; // 僅允許英文字母和數字
		}
	}
	return true;
}

// 檢查函數名稱是否符合條件（3 個字母內，開頭為英文字母，僅限英文和數字）
bool isValidContentName(const string &str)
{
	if (str.empty() || str.size() > 3 || !isalpha(str[0]))
		return false; // 檢查是否為 1-3 個字符且開頭為英文字母

	for (char ch : str)
	{
		if (!isalnum(ch))
		{
			return false; // 僅允許英文字母和數字
		}
	}
	return true;
}

// 檢查資料夾名稱是否僅包含英文字母或數字，且開頭為英文字母
bool isAlphanumeric(const string &str)
{
	if (str.empty() || !isalpha(str[0]))
		return false; // 檢查開頭是否為英文字母

	for (char ch : str)
	{
		if (!isalnum(ch))
		{
			return false; // 僅允許英文字母和數字
		}
	}
	return true;
}

// 將路徑中的反斜杠轉為正斜杠
void convertBackslashesToSlashes(string &path)
{
	replace(path.begin(), path.end(), '\\', '/');
}

// 讀取用戶輸入的Sleep毫秒
int readSleepTime(const string &prompt, const vector<int> &defaults)
{
	setConsoleCodePage();
	cout << prompt << endl;
	foru(i, 0, defaults.size() - 1)
	{
		cout << i + 1 << ". 默認值 " << defaults[i] << " 毫秒" << endl;
	}
	cout << (defaults.size() + 1) << ". 自行輸入一個數字" << endl;

	while (true)
	{
		cout << "請選擇一個選項 (1-" << defaults.size() + 1 << "): ";
		string input;
		cin >> input;

		if (all_of(input.begin(), input.end(), ::isdigit))
		{
			int choice = stoi(input);
			if (choice >= 1 && choice <= defaults.size())
			{
				return defaults[choice - 1];
			}
			else if (choice == defaults.size() + 1)
			{
				cout << "請輸入自定義的 sleep 時間（毫秒）：";
				cin >> input;
				if (all_of(input.begin(), input.end(), ::isdigit))
				{
					return stoi(input);
				}
			}
		}
		cout << "無效的輸入，請重新選擇。" << endl;
	}
}

// 生成所有檔案
void generateFiles(const string &folderName, const string &tickerName, const string &tickerContentName, int fileCount, const string &utilPath, int sleepTime1, int sleepTime2, char outputDone)
{
	setConsoleCodePage();
	// 生成檔案
	foru(i, 1, fileCount)
	{
		string filename = folderName + "/" + tickerName + to_string(i) + ".cfg";
		freopen(filename.c_str(), "w", stdout);
		string tickerNameBegin = tickerContentName + to_string(i);

		// 生成 sleep 命令
		foru(j, 1, i - 1)
		{
			cout << "sleep " << sleepTime1 << "\n";
		}
		cout << (tickerNameBegin + "_Begin") << '\n';

		// 交替輸出 sleep 和 Ticker 內容
		for (int k = 2; k <= 120001; k++)
		{
			cout << (k % 2 == 0 ? "sleep " + to_string(sleepTime2) + "\n" : tickerNameBegin + "\n");
		}

		if (outputDone == 'y' || outputDone == 'Y')
		{
			cout << "echoln done " + tickerNameBegin << endl;
		}
	}

	// 生成 Manager.cfg
	{
		string managerFile = folderName + "/" + tickerName + "Manager.cfg";
		freopen(managerFile.c_str(), "w", stdout);
		cout << "exec " << utilPath << "/" << folderName << "/" << tickerName << "Defines\n";
		cout << "sv_cheats 1\nDontExecuteThisAgain\n";
		cout << "exec_async " << utilPath << "/" << folderName << "/" << tickerName << "Loading\n";
		cout << "sv_cheats 1\n";
		fflush(stdout);
		freopen("CON", "w", stdout);
	}

	// 生成 Defines.cfg
	{
		string definesFile = folderName + "/" + tickerName + "Defines.cfg";
		freopen(definesFile.c_str(), "w", stdout);
		cout << "alias " << tickerContentName << " \"\"\n";
		fflush(stdout);
		freopen("CON", "w", stdout);
	}

	// 生成 Setup.cfg
	{
		string setupFile = folderName + "/" + tickerName + "Setup.cfg";
		freopen(setupFile.c_str(), "w", stdout);
		foru(i, 1, fileCount)
		{
			cout << "exec_async " << utilPath << "/" << folderName << "/" << tickerName << i << "\n";
		}
		fflush(stdout);
		freopen("CON", "w", stdout);
	}

	// 生成 Loading.cfg
	{
		string loadingFile = folderName + "/" + tickerName + "Loading.cfg";
		freopen(loadingFile.c_str(), "w", stdout);
		cout << "alias " << tickerContentName << "_Clear \"";
		foru(i, 1, fileCount)
		{
			cout << "alias " << tickerContentName << i << " \"\";" << (i < fileCount ? " " : "");
		}
		cout << "\"";

		cout << "\n\nalias " << tickerContentName << "tmpts " << "\"echoln New Beginning " << tickerContentName << "\"\n\n";

		foru(i, 1, fileCount)
		{
			cout << "alias " << tickerContentName << i << "_Begin \"" << tickerContentName << "_Clear; alias " << tickerContentName << i << " " << tickerContentName << "; " << tickerContentName << "tmpts\"\n";
		}

		cout << "\nexec " << utilPath << "/" << folderName << "/" << tickerName << "Setup\n";
		fflush(stdout);
		freopen("CON", "w", stdout); // 将输出重定向回控制台
	}
}

int main()
{
	setConsoleCodePage();
	string tickerName, tickerContentName, folderName, utilPath;
	int sleepTime1, sleepTime2;

	cout << "請輸入要生成的文件數量(建議輸入20)：";
	int fileCount = rin();
	while (fileCount <= 0)
	{
		cout << "無效的數量，請輸入一個大於0的數量：";
		fileCount = rin();
	}

	// 檔案名稱輸入與檢查
	cout << "請輸入 Ticker 的檔案名稱（開頭英文，僅限英文和數字不能有中文）：";
	cin >> tickerName;
	while (!isValidFileName(tickerName))
	{
		cout << "無效的檔案名稱，請重新輸入（開頭英文，僅限英文和數字不能有中文）：";
		cin >> tickerName;
	}
	cout << "有效的檔案名稱：" << tickerName << endl;

	// 函數名稱輸入與檢查
	cout << "請輸入 Ticker 的函數名稱（3 個字母內，開頭英文，僅限英文和數字不能有中文）：";
	cin >> tickerContentName;
	while (!isValidContentName(tickerContentName))
	{
		cout << "無效的名稱，請重新輸入（3 個字母內，開頭英文，僅限英文和數字不能有中文）：";
		cin >> tickerContentName;
	}
	cout << "有效的函數名稱：" << tickerContentName << endl;

	// 資料夾名稱輸入與檢查
	cout << "請輸入資料夾名稱（開頭英文，僅限英文和數字不能有中文）：";
	cin >> folderName;
	while (!isAlphanumeric(folderName))
	{
		cout << "無效的資料夾名稱，請重新輸入（開頭英文，僅限英文和數字不能有中文）：";
		cin >> folderName;
	}

	// 創建資料夾
	if (mkdir(folderName.c_str()) != 0)
	{
		cout << "有效的資料夾名稱：" << folderName << endl;
		cout << "資料夾已存在或創建失敗，將使用已存在的資料夾。" << endl;
	}
	else
	{
		cout << "有效的資料夾名稱：" << folderName << endl;
		cout << "資料夾創建成功！" << endl;
	}

	// 路徑輸入
	cout << "你的CFG資料夾/生成器位置，像這樣yyy/xxx\n請輸入路徑：";
	cin.ignore(numeric_limits<streamsize>::max(), '\n'); // 清除缓冲区的残留输入
	cin >> utilPath;
	while (utilPath.empty())
	{
		cout << "路徑不能為空，請重新輸入：";
		cin.ignore(numeric_limits<streamsize>::max(), '\n'); // 清除缓冲区
		cin >> utilPath;
	}
	convertBackslashesToSlashes(utilPath);

	vector<int> sleepOptions1 = {600000};
	vector<int> sleepOptions2 = {10};
	sleepTime1 = readSleepTime("請選擇 sleep 的時間", sleepOptions1);
	sleepTime2 = readSleepTime("請選擇每次 sleep 的時間", sleepOptions2);

	char outputDone;
	while (true)
	{
		cout << "您希望輸出完成提示嗎？ (Y/N): ";
		cin >> outputDone;
		if (outputDone == 'y' || outputDone == 'Y' || outputDone == 'n' || outputDone == 'N')
		{
			break;
		}
		else
		{
			cout << "無效的輸入，請輸入 'Y' 或 'N'。" << endl;
		}
	}

	// 调用生成文件的函数
	generateFiles(folderName, tickerName, tickerContentName, fileCount, utilPath, sleepTime1, sleepTime2, outputDone);

	cout << "所有文件已成功生成！" << endl;
	cout << "按任意鍵繼續..." << endl;
	cin.ignore();
	cin.get();

	return 0;
}
