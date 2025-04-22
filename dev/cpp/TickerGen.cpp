#include <bits/stdc++.h>

namespace fs = std::filesystem;
using namespace std;

int main()
{
    int dur = 120;
    int n = 100000;
    int m = 2;

    string idx1 = "%";
    string idx2 = "pk";
    string file_name = "120ms";
    string ticker_name = "Ticker";

    string ticker_path = "DreamWind/src/util/ticker";

    if (!fs::exists(file_name))
    {
        fs::create_directory(file_name);
    }

    string folder_path = format("{}/files", file_name);
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
        ot[1] = format("{}{}{}", idx1, idx2, getid());

        for (int j = 1; j < i; j++)
        {
            fout << format("sleep {}\n", n / 2 * dur);
        }
        fout << format("{}_{}_{}_begin\n", ticker_name, idx2, getid());
        for (int j = 1; j <= n; j++)
        {
            fout << ot[j & 1] << '\n';
        }
        if (i == m)
        {
            fout << format("exec {}/{}/Dead", ticker_path, file_name);
        }
        fout.close();
    }

    ofstream fout(format("{}/Dead.cfg", file_name), ios::out);
    fout << format("//will last {:.4f}s ({:.4f}h)\n", (n / 2) / 1000.0 * dur * m, double((n / 2) * dur / 1000.0 / 3600.0 * m));
    fout << format("alias {0}{1} \"echoln Ticker {1} died!\"", idx1, idx2);
    fout.close();

    fout = ofstream(format("{}/Init.cfg", file_name), ios::out);
    fout << format("alias {}_{}_clr \"", ticker_name, idx2);
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
        fout << format("alias {}{}{}{}", idx1, idx2, getid(), (i == m ? "": " ;"));
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
        fout << format("alias {0}_{2}_{3}_begin \"{0}_{2}_clr;alias {1}{2}{3} {1}{2}\"\n", ticker_name, idx1, idx2, getid());
    }
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
        fout << format("exec_async {}/{}/files/_{}.cfg\n", ticker_path, file_name, getid());
    }

    fout.close();

    ofstream reg_fout(format("{}/Reg.cfg", file_name), ios::out);
    reg_fout << format("alias {}{} \"{}_{}\"\n", idx1, idx2, ticker_name, file_name);
    reg_fout << format("alias {}_{} \"\"\n", ticker_name, file_name);
    reg_fout.close();

    return 0;
}
