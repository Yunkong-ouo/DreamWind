#include <bits/stdc++.h>

namespace fs = std::filesystem;
using namespace std;

int main()
{
    int dur = 120;
    int n = 100000;
    int m = 2;
    string idx = "pk";
    string idx2 = "%";
    string midx = "120ms";
    string ticker_path = "CS2Konc_CFG/util/ticker";
    string ticker_name = "Ticker";

    if (!fs::exists(midx))
    {
        fs::create_directory(midx);
    }

    string folder_path = format("{}/files", midx);
    if (!fs::exists(folder_path))
    {
        fs::create_directories(folder_path);
    }

    string ot[2];
    ot[0] = format("sleep {}", dur);

    for (int i = 1; i <= m; i++)
    {
        auto getid = [&]() -> char
        {
            int x = i - 1;
            char C = '0';
            if (x >= 10)
                C = 'a', x -= 10;
            return C + x;
        };

        ofstream fout(format("{}/_{}.cfg", folder_path, getid()), ios::out | ios::binary);
        ot[1] = format("{}{}{}", idx2, idx, getid());

        for (int j = 1; j < i; j++)
        {
            fout << format("sleep {}\n", n / 2 * dur);
        }
        fout << format("{}_{}_{}_bg\n", ticker_name, idx, getid());
        for (int j = 1; j <= n; j++)
        {
            fout << ot[j & 1] << '\n';
        }
        if (i == m)
        {
            fout << format("exec {}/{}/dead", ticker_path, midx);
        }
        fout.close();
    }

    ofstream fout(format("{}/dead.cfg", midx), ios::out);
    fout << format("//will last {:.4f}s ({:.4f}h)\n", (n / 2) / 1000.0 * dur * m, double((n / 2) * dur / 1000.0 / 3600.0 * m));
    fout << format("alias {0}{1} \"echoln Ticker {1} died!\"", idx2, idx);
    fout.close();

    fout = ofstream(format("{}/loader.cfg", midx), ios::out);
    fout << format("alias {}_{}_clr \"", ticker_name, idx);
    for (int i = 1; i <= m; i++)
    {
        auto getid = [&]() -> char
        {
            int x = i - 1;
            char C = '0';
            if (x >= 10)
                C = 'a', x -= 10;
            return C + x;
        };
        fout << format("alias {}{}{} {}", idx2, idx, getid(), (i == m ? "" : ";"));
    }
    fout << "\"\n";
    fout << "\n";

    for (int i = 1; i <= m; i++)
    {
        auto getid = [&]() -> char
        {
            int x = i - 1;
            char C = '0';
            if (x >= 10)
                C = 'a', x -= 10;
            return C + x;
        };
        fout << format("alias {0}_{2}_{3}_bg \"{0}_{2}_clr;alias {1}{2}{3} {1}{2}\"\n", ticker_name, idx2, idx, getid());
    }
    fout << "\n";
    fout << format("exec {}/{}/reg", ticker_path, midx) << "\n";
    fout << "\n";

    for (int i = 1; i <= m; i++)
    {
        auto getid = [&]() -> char
        {
            int x = i - 1;
            char C = '0';
            if (x >= 10)
                C = 'a', x -= 10;
            return C + x;
        };
        fout << format("exec_async {}/{}/files/_{}.cfg\n", ticker_path, midx, getid());
    }

    fout.close();

    ofstream reg_fout(format("{}/reg.cfg", midx), ios::out);
    reg_fout << format("alias {}{} \"{}_{}\"\n", idx2, idx, ticker_name, midx);
    reg_fout << format("alias {}_{} \"\"\n", ticker_name, midx);
    reg_fout.close();

    return 0;
}
