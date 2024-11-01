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

// 檢查字符串是否符合要求
bool isValidContentName(const string &name)
{
	return name.length() <= 3 && all_of(name.begin(), name.end(), ::isalpha);
}

bool isAlphanumeric(const string &str)
{
	return all_of(str.begin(), str.end(), ::isalnum);
}

// 檢查字符串是否只包含字母
bool isAlpha(const string &str)
{
	return all_of(str.begin(), str.end(), ::isalpha);
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

// 生成文件
void generateFile(const string &filename, const string &tickerContentName, int sleepTime1, int sleepTime2, int index, char outputDone)
{
	freopen(filename.c_str(), "w", stdout);
	string tickerNameBegin = tickerContentName + to_string(index);

	// 生成 sleep 命令
	foru(j, 1, index - 1)
	{
		cout << "sleep " << sleepTime1 << "\n";
	}
	cout << (tickerNameBegin + "_begin") << '\n';

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

	cout << "請輸入 Ticker 的檔案名稱（英文）：";
	cin >> tickerName;
	while (!isAlpha(tickerName)) // 檢查是否為英文字符
	{
		cout << "無效的檔案名稱，請重新輸入（僅限英文）：";
		cin >> tickerName;
	}

	cout << "請輸入 Ticker 的參數名稱（3 個字母，英文）：";
	cin >> tickerContentName;
	while (!isValidContentName(tickerContentName))
	{
		cout << "無效的名稱，請重新輸入（3 個字母，英文）：";
		cin >> tickerContentName;
	}

	cout << "請輸入資料夾名稱（僅限英文和數字）：";
	cin >> folderName;
	while (!isAlphanumeric(folderName))
	{
		cout << "無效的資料夾名稱，請重新輸入（僅限英文和數字）：";
		cin >> folderName;
	}

	// 嘗試創建資料夾
	if (mkdir(folderName.c_str()) != 0)
	{
		cout << "資料夾已存在或創建失敗，將使用已存在的資料夾。" << endl;
	}

	// 提示用戶輸入路徑
	cout << "你的CFG資料夾/生成器位置：CS2Konc_CFG/util\n請輸入路徑：";
	cin >> utilPath;
	while (utilPath.empty())
	{
		cout << "路徑不能为空，請重新輸入：";
		cin >> utilPath;
	}
	convertBackslashesToSlashes(utilPath);

	vector<int> sleepOptions1 = {600000, 700000, 800000};
	vector<int> sleepOptions2 = {10, 9, 15};
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

	foru(i, 1, fileCount)
	{
		generateFile(folderName + "/" + tickerName + to_string(i) + ".cfg", tickerContentName, sleepTime1, sleepTime2, i, outputDone);
	}

	// 生成 Manager.cfg
	{
		string managerFile = folderName + "/" + tickerName + "Manager.cfg";
		freopen(managerFile.c_str(), "w", stdout);
		cout << "exec " << utilPath << "/" << folderName << "/" << tickerName << "Defines\n";
		cout << "sv_cheats 1\nDontExecuteThisAgain\n";
		cout << "exec_async " << utilPath << "/" << folderName << "/" << tickerName << "Loading\n";
		cout << "sv_cheats 1\n";
	}

	// 生成 Defines.cfg
	{
		string definesFile = folderName + "/" + tickerName + "Defines.cfg";
		freopen(definesFile.c_str(), "w", stdout);
		cout << "alias " << tickerContentName << " \"\"\n";
	}

	// 生成 Setup.cfg
	{
		string setupFile = folderName + "/" + tickerName + "Setup.cfg";
		freopen(setupFile.c_str(), "w", stdout);
		foru(i, 1, fileCount)
		{
			cout << "exec_async " << utilPath << "/" << folderName << "/" << tickerName << i << "\n";
		}
	}

	// 生成 Loading.cfg
	{
		string loadingFile = folderName + "/" + tickerName + "Loading.cfg";
		freopen(loadingFile.c_str(), "w", stdout);
		cout << "alias " << tickerContentName << "clear \"";
		foru(i, 1, fileCount)
		{
			cout << "alias " << tickerContentName << i << " \"\";" << (i < fileCount ? " " : "");
		}
		cout << "\"\nalias tmpts \"echoln New Beginning " << tickerContentName << "\"\n";
		foru(i, 1, fileCount)
		{
			cout << "alias " << tickerContentName << i << "_begin \"" << tickerContentName << "clear; alias " << tickerContentName << i << " " << tickerContentName << "; tmpts\"\n";
		}
		cout << "\nexec_async " << utilPath << "/" << folderName << "/" << tickerName << "Setup\n";
	}

	return 0;
}
