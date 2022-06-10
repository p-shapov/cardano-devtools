'use strict';

const path = require('path');

const HtmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const NodePolyfillPlugin = require('node-polyfill-webpack-plugin');

const isDevelopment = process.env.NODE_ENV === 'development';

const devtool = isDevelopment ? 'eval-source-map' : false;

module.exports = {
  mode: 'development',
  experiments: {
    asyncWebAssembly: true,
  },
  devtool,
  devServer: {
    hot: true,
    historyApiFallback: {
      disableDotRule: true,
    },
    client: {
      overlay: {
        errors: true,
        warnings: false,
      },
    },
  },
  entry: './public/index.js',
  output: {
    filename: '[name].[contenthash].js',
    publicPath: '',
    path: path.join(__dirname, 'dist'),
    pathinfo: true,
    clean: true,
  },
  optimization: {
    runtimeChunk: 'single',
    splitChunks: {
      cacheGroups: {
        vendor: {
          test: /[\\/]node_modules[\\/]/,
          name: 'vendors',
          chunks: 'all',
        },
      },
    },
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [MiniCssExtractPlugin.loader, 'css-loader'],
      },
      {
        test: /\.(png|svg|jpg|jpeg|gif)$/i,
        type: 'asset/resource',
        generator: {
          filename: 'assets/images/[name][ext]'
        }
      },
      {
        test: /\.(woff|woff2|eot|ttf|otf)$/i,
        type: 'asset/resource',
      },
    ],
  },
  resolve: {
    modules: ['node_modules'],
    extensions: ['.js'],
    fallback: {
      fs: false,
    },
  },
  resolveLoader: {
    modules: ['node_modules', path.resolve(__dirname, '.')],
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: 'public/index.html',
      title: 'Cardano Devtools',
    }),
    new MiniCssExtractPlugin({
      filename: '[name].[contenthash].css',
    }),
    // allows to use modules from NodeJS like `Buffer` or `Util`.
    new NodePolyfillPlugin(),
  ],
};
