#include <bits/stdc++.h>

namespace fs = std::filesystem;
using namespace std;

int main()
{
    int L = 520000;
    int slp = L / 0.8;
    int m = 25;

    const string us = "abcdefghijklmnopqrsuvwxyz";

    string file_name = "ninf";
    string ticker_name = "Ticker";

    string ticker_path = "DreamWind/src/util/ticker";

    if (!fs::exists(file_name + "/files"))
    {
        fs::create_directories(file_name + "/files");
    }

    for (int i = 0; i < m; i++)
    {
        ofstream fout(format("{}/files/_{}.cfg", file_name, i), ios::out | ios::binary);

        for (int j = 1; j <= i; j++)
        {
            fout << "sleep " + to_string(slp) << '\n';
        }

        fout << format("{}_{}_{}_begin\n", ticker_name, file_name, i);

        for (int j = 1; j <= L; j++)
        {
            fout << us[i] << '\n';
        }

        fout.close();
    }

    cout << "us " << ((slp * m) / 1000.0 / 3600.0) << endl;

    ofstream fout(format("{}/Init.cfg", file_name), ios::out | ios::binary);

    fout << format("alias {}_{}_clr \"", ticker_name, file_name);
    for (int i = 0; i < m; i++)
    {
        fout << format("alias {} ;", us[i]);
    }
    fout << "\"\n";

    for (int i = 0; i < m; i++)
    {
        fout << format("alias {0}_{1}_{2}_begin \"{0}_{1}_clr; alias {3} $\"\n", ticker_name, file_name, i, us[i]);
    }

    fout << '\n';

    for (int i = 0; i < m; i++)
    {
        fout << format("exec_async {}/{}/files/_{}.cfg\n", ticker_path, file_name, i);
    }

    fout.close();

    ofstream reg_fout(format("{}/Reg.cfg", file_name), ios::out);
    reg_fout << format("alias $ \"{}_1FPS\"\n", ticker_name);
    reg_fout << format("alias {}_1FPS \"\"\n", ticker_name);
    reg_fout.close();

    return 0;
}
