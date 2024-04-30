#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>

using namespace std;

vector<int> v1;

class TRoot
{
public:
    int Key;
    TRoot* Left;
    TRoot* Right;
    int height;
    int kids;

    TRoot()
    {
        Key = 0;
        Left = 0;
        Right = 0;
        height = 0;
        kids = 0;
    }

    TRoot(int key)
    {
        Key = key;
        Left = 0;
        Right = 0;
        height = 0;
        kids = 0;
    }
};

class TTree
{
public:

    TRoot* Root;

    TTree()
    {
        Root = 0;
    }

    ~TTree()
    {
        DestroyNode(Root);
    }

    void add(int x)
    {
        TRoot** cur = &Root;
        while (*cur)
        {
            TRoot& node = **cur;
            if (x < node.Key)
            {
                cur = &node.Left;
            }
            else if (x > node.Key)
            {
                cur = &node.Right;
            }
            else
            {
                return;
            }
        }
        *cur = new TRoot(x);
    }

    void obhod(TRoot* root, ofstream& out)
    {
        if (root == NULL)
            return;

        out << root->Key << endl;

        obhod(root->Left, out);
        obhod(root->Right, out);
    }

    void function(TRoot* root)
    {
        if (root == NULL)
            return;

        function(root->Left);
        function(root->Right);

        if (root->Left != NULL && root->Right != NULL)
            if (root->Left->height == root->Right->height && root->Left->kids != root->Right->kids)
                v1.push_back(root->Key);
    }

    void height(TRoot* a)
    {
        if (a == NULL)
            return;

        if (a->Right == NULL && a->Left == NULL)
        {
            a->height = 0;

            return;
        }

        if (a->Left == NULL)
        {
            height(a->Right);

            a->height = a->Right->height + 1;
        }

        if (a->Right == NULL)
        {
            height(a->Left);

            a->height = a->Left->height + 1;
        }

        if (a->Right != NULL && a->Left != NULL)
        {
            height(a->Left);
            height(a->Right);

            if (a->Left->height == 0)
                a->height = a->Right->height + 1;

            if (a->Right->height == 0)
                a->height = a->Left->height + 1;

            else
                a->height = max(a->Left->height, a->Right->height) + 1;
        }
    }

    void potomok(TRoot* a)
    {
        if (a == NULL)
            return;

        potomok(a->Left);
        potomok(a->Right);

        if (a->Right == NULL && a->Left == NULL)
        {
            a->kids = 0;

            return;
        }

        if (a->Right != NULL && a->Left != NULL)
        {
            a->kids = a->Left->kids + a->Right->kids + 2;
        }

        if (a->Left == NULL)
        {
            a->kids = a->Right->kids + 1;
        }

        if (a->Right == NULL)
        {
            a->kids = a->Left->kids + 1;
        }
    }

    TRoot* delete_(TRoot* root, int key)
    {
        if (!root)
        {
            return root;
        }
        if (key < root->Key)
        {
            root->Left = delete_(root->Left, key);
            return root;
        }

        else if (key > root->Key)
        {
            root->Right = delete_(root->Right, key);
            return root;
        }

        if (root->Left == NULL)
            return root->Right;
        else if (root->Right == NULL)
            return root->Left;
        else
        {
            int min_key = find_min(root->Right).Key;
            root->Key = min_key;
            root->Right = delete_(root->Right, min_key);
            return root;
        }
    }

    TRoot find_min(TRoot* root)
    {
        if (root->Left != NULL)
            return find_min(root->Left);
        else
            return *root;
    }

private:
    static void DestroyNode(TRoot* node)
    {
        if (node)
        {
            DestroyNode(node->Left);
            DestroyNode(node->Right);
            delete node;
        }
    }
};

int main()
{
    ifstream fin("input.txt");
    ofstream fout("output.txt");

    TTree tree;
    long long a;

    while (fin >> a)
        tree.add(a);

    tree.obhod(tree.Root, fout);

    tree.potomok(tree.Root);
    tree.height(tree.Root);
    tree.function(tree.Root);

    sort(v1.begin(), v1.end());

    if (!v1.empty())
    {
        if (v1.size() % 2 != 0)
        {
            if (v1.size() != 1)
                tree.delete_(tree.Root, v1[v1.size() / 2 + 1]);
            else
                tree.delete_(tree.Root, v1[v1.size() / 2]);
        }
    }

    tree.obhod(tree.Root, fout);

    return 0;
}